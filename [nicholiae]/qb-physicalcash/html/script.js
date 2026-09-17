let minAmount = 1;
let maxAmount = 100000;

// Listen for messages from the game
window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'openMenu') {
        openMenu(data.config);
    } else if (data.action === 'closeMenu') {
        closeMenu();
    }
});

// Open the menu
function openMenu(config) {
    if (config) {
        minAmount = config.minAmount || 1;
        maxAmount = config.maxAmount || 100000;
        
        document.getElementById('minAmount').textContent = minAmount.toLocaleString();
        document.getElementById('maxAmount').textContent = maxAmount.toLocaleString();
        document.getElementById('amountInput').min = minAmount;
        document.getElementById('amountInput').max = maxAmount;
    }
    
    document.getElementById('cashMenu').style.display = 'block';
    document.getElementById('amountInput').value = '';
    document.getElementById('amountInput').focus();
    hideMessages();
}

// Close the menu
function closeMenu() {
    document.getElementById('cashMenu').style.display = 'none';
    hideMessages();
    hideLoading();
    
    // Notify the game
    fetch(`https://qb-physicalcash/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

// Show error message
function showError(message) {
    const errorEl = document.getElementById('errorMessage');
    errorEl.textContent = message;
    errorEl.style.display = 'block';
    
    setTimeout(() => {
        hideMessages();
    }, 5000);
}

// Show success message
function showSuccess(message) {
    const successEl = document.getElementById('successMessage');
    successEl.textContent = message;
    successEl.style.display = 'block';
    
    setTimeout(() => {
        hideMessages();
    }, 3000);
}

// Hide all messages
function hideMessages() {
    document.getElementById('errorMessage').style.display = 'none';
    document.getElementById('successMessage').style.display = 'none';
}

// Show loading indicator
function showLoading() {
    document.getElementById('loadingIndicator').style.display = 'block';
    document.getElementById('convertBtn').disabled = true;
    document.getElementById('cancelBtn').disabled = true;
}

// Hide loading indicator
function hideLoading() {
    document.getElementById('loadingIndicator').style.display = 'none';
    document.getElementById('convertBtn').disabled = false;
    document.getElementById('cancelBtn').disabled = false;
}

// Validate amount
function validateAmount(amount) {
    if (!amount || isNaN(amount)) {
        return { valid: false, message: 'Please enter a valid amount' };
    }
    
    amount = parseInt(amount);
    
    if (amount < minAmount) {
        return { valid: false, message: `Amount must be at least $${minAmount.toLocaleString()}` };
    }
    
    if (amount > maxAmount) {
        return { valid: false, message: `Amount cannot exceed $${maxAmount.toLocaleString()}` };
    }
    
    return { valid: true, amount: amount };
}

// Convert to physical cash
function convertToPhysical() {
    const amountInput = document.getElementById('amountInput').value;
    const validation = validateAmount(amountInput);
    
    if (!validation.valid) {
        showError(validation.message);
        playSound();
        return;
    }
    
    hideMessages();
    showLoading();
    
    // Send to game
    fetch(`https://qb-physicalcash/convertToPhysical`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            amount: validation.amount
        })
    })
    .then(resp => resp.json())
    .then(data => {
        hideLoading();
        
        if (data.success) {
            showSuccess(data.message || 'Conversion successful!');
            setTimeout(() => {
                closeMenu();
            }, 2000);
        } else {
            showError(data.message || 'Conversion failed');
            playSound();
        }
    })
    .catch(error => {
        hideLoading();
        showError('An error occurred during conversion');
        playSound();
        console.error('Conversion error:', error);
    });
}

// Play sound
function playSound() {
    fetch(`https://qb-physicalcash/playSound`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

// Get parent resource name
function GetParentResourceName() {
    let resourceName = 'qb-physicalcash';
    if (window.location.href.includes('://')) {
        const parts = window.location.href.split('/');
        resourceName = parts[parts.length - 3];
    }
    return resourceName;
}

// Event listeners
document.getElementById('convertBtn').addEventListener('click', convertToPhysical);
document.getElementById('cancelBtn').addEventListener('click', closeMenu);

// Quick amount buttons
document.querySelectorAll('.quick-amount-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        const amount = this.getAttribute('data-amount');
        document.getElementById('amountInput').value = amount;
        playSound();
    });
});

// Enter key to convert
document.getElementById('amountInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        convertToPhysical();
    }
});

// ESC key to close
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        closeMenu();
    }
});

// Format input as user types (add commas)
document.getElementById('amountInput').addEventListener('input', function(e) {
    let value = this.value.replace(/,/g, '');
    if (value && !isNaN(value)) {
        // Remove leading zeros
        value = parseInt(value).toString();
        this.value = value;
    }
});