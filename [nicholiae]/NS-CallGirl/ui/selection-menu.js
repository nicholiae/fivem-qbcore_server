/* ============================================
   CallGirl Selection Menu - JavaScript
   Handles menu interactions and data display
   FIXED: Added menu-active class management
   FIXED v2: Updated to use index numbers instead of model hashes
   ============================================ */

// Prostitute image mapping - FIXED: Use index numbers (1,2,3,4)
const PROSTITUTE_IMAGES = {
    '1': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400&fit=crop',
    '2': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400&h=400&fit=crop',
    '3': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400&h=400&fit=crop',
    '4': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=400&h=400&fit=crop'
};

// Tier colors
const TIER_COLORS = {
    1: '#95a5a6',
    2: '#3498db',
    3: '#9b59b6',
    4: '#e91e63',
    5: '#f39c12'
};

// Base configuration
const BASE_PRICE = 8000;

// Global state
let prostituteData = [];
let menuOpen = false;

// Event listeners
window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'openMenu') {
        console.log('Opening menu with data:', data.prostitutes); // Debug log
        openMenu(data.prostitutes);
    } else if (data.action === 'closeMenu') {
        closeMenu();
    }
});

// Document ready
document.addEventListener('DOMContentLoaded', function() {
    // Initialize with hidden menu
    document.querySelector('.menu-container').style.display = 'none';
    // Ensure body doesn't have menu-active class on load
    document.body.classList.remove('menu-active');
});

/** 
 * Open the selection menu
 */
function openMenu(data) {
    prostituteData = data;
    console.log('Prostitute data loaded:', prostituteData); // Debug log
    renderProstitutes();
    
    const menuContainer = document.querySelector('.menu-container');
    menuContainer.style.display = 'block';
    
    // FIXED: Add menu-active class to show gradient background
    document.body.classList.add('menu-active');
    
    menuOpen = true;
}

/**
 * Close the selection menu
 */
function closeMenu() {
    const menuContainer = document.querySelector('.menu-container');
    menuContainer.style.display = 'none';
    
    // FIXED: Remove menu-active class to hide gradient background
    document.body.classList.remove('menu-active');
    
    menuOpen = false;
    
    // Send close event to game
    fetch('https://NS-CallGirl/closeMenu', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

/**
 * Calculate tier based on reputation
 */
function calculateTier(reputation) {
    const tiers = [
        { min: 0, max: 20, tier: 1 },
        { min: 21, max: 40, tier: 2 },
        { min: 41, max: 60, tier: 3 },
        { min: 61, max: 80, tier: 4 },
        { min: 81, max: 100, tier: 5 }
    ];
    
    for (let i = tiers.length - 1; i >= 0; i--) {
        if (reputation >= tiers[i].min) {
            return tiers[i].tier;
        }
    }
    return 1;
}

/**
 * Calculate price with discount
 */
function calculatePrice(tier) {
    const tierBonuses = {
        1: 0.0,
        2: 0.10,
        3: 0.20,
        4: 0.35,
        5: 0.50
    };
    
    const discount = tierBonuses[tier] || 0.0;
    if (tier >= 5) {
        return 0; // Free for tier 5
    }
    return Math.floor(BASE_PRICE * (1 - discount));
}

/**
 * Format price display
 */
function formatPrice(price) {
    if (price === 0) {
        return 'FREE';
    }
    return `$${price.toLocaleString()}`;
}

/**
 * Render all prostitute cards
 */
function renderProstitutes() {
    const grid = document.getElementById('prostitutesGrid');
    const template = document.getElementById('prostituteCardTemplate');
    
    grid.innerHTML = '';
    
    prostituteData.forEach(data => {
        console.log('Rendering card for:', data); // Debug log
        
        const card = template.content.cloneNode(true);
        const cardElement = card.querySelector('.prostitute-card');
        
        // Set model data attribute - use prostitute_index for UI
        cardElement.setAttribute('data-model', data.prostitute_index || data.prostitute_model);
        
        // Use prostitute_index for image lookup (1,2,3,4)
        const modelKey = String(data.prostitute_index || data.prostitute_model);
        console.log('Looking up data for model key:', modelKey); // Debug log
        
        // Set profile image
        const imageElement = card.querySelector('.profile-image img');
        const imageUrl = PROSTITUTE_IMAGES[modelKey];
        console.log('Image URL:', imageUrl); // Debug log
        
        if (imageUrl) {
            imageElement.src = imageUrl;
            imageElement.alt = data.prostitute_name;
            
            // Add error handler for image loading
            imageElement.onerror = function() {
                console.error('Failed to load image:', imageUrl);
                this.src = 'https://via.placeholder.com/400x400/667eea/ffffff?text=' + encodeURIComponent(data.prostitute_name);
            };
        } else {
            console.warn('No image found for model:', modelKey);
            imageElement.src = 'https://via.placeholder.com/400x400/667eea/ffffff?text=' + encodeURIComponent(data.prostitute_name);
        }
        
        // Set tier badge
        const tierBadge = card.querySelector('.tier-badge');
        const tierText = card.querySelector('.tier-text');
        tierText.textContent = data.relationship_status || 'STRANGER';
        tierBadge.style.background = `rgba(${hexToRgb(TIER_COLORS[data.tier] || '#95a5a6')}, 0.8)`;
        
        // Set name and nickname
        card.querySelector('.prostitute-name').textContent = data.prostitute_name || 'Unknown';
        const nickname = getNickname(modelKey);
        console.log('Nickname:', nickname); // Debug log
        card.querySelector('.prostitute-nickname').textContent = nickname;
        
        // Set personality
        const personality = getPersonality(modelKey);
        console.log('Personality:', personality); // Debug log
        card.querySelector('.personality-badge').textContent = personality;
        
        // Set description
        const description = getDescription(modelKey);
        console.log('Description:', description); // Debug log
        card.querySelector('.description-text').textContent = description;
        
        // Set reputation value and bar
        const reputation = data.reputation || 0;
        card.querySelector('.rep-value').textContent = `${reputation}/100`;
        const repBarFill = card.querySelector('.rep-bar-fill');
        repBarFill.style.width = `${reputation}%`;
        repBarFill.style.background = TIER_COLORS[data.tier] || '#3498db';
        
        // Set price
        const price = calculatePrice(data.tier || 1);
        card.querySelector('.price-value').textContent = formatPrice(price);
        
        // Set sessions
        card.querySelector('.sessions-value').textContent = data.total_interactions || 0;
        
        // Add click event - send prostitute_index to server
        cardElement.addEventListener('click', function() {
            selectProstitute(data.prostitute_index || data.prostitute_model);
        });
        
        grid.appendChild(card);
    });
    
    console.log('Finished rendering', prostituteData.length, 'cards'); // Debug log
}

/**
 * Select a prostitute
 */
function selectProstitute(model) {
    console.log('Selected prostitute model:', model); // Debug log
    fetch('https://NS-CallGirl/selectProstitute', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            model: model
        })
    }).then(() => {
        closeMenu();
    });
}

/**
 * Get nickname for prostitute model - FIXED: Use index numbers
 */
function getNickname(model) {
    const nicknames = {
        '1': 'The Beach Girl',
        '2': 'The Hills Princess',
        '3': 'The Socialite',
        '4': 'The Business Woman'
    };
    return nicknames[model] || 'Unknown';
}

/**
 * Get personality for prostitute model - FIXED: Use index numbers
 */
function getPersonality(model) {
    const personalities = {
        '1': 'Flirty',
        '2': 'Demanding',
        '3': 'Sophisticated',
        '4': 'Professional'
    };
    return personalities[model] || 'Unknown';
}

/**
 * Get description for prostitute model - FIXED: Use index numbers
 */
function getDescription(model) {
    const descriptions = {
        '1': 'A carefree spirit who loves the beach life',
        '2': 'High maintenance but worth every penny',
        '3': 'Elegant and refined, she knows her worth',
        '4': 'All business, no games'
    };
    return descriptions[model] || 'No description available';
}

/**
 * Convert hex color to RGB
 */
function hexToRgb(hex) {
    const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? 
        `${parseInt(result[1], 16)}, ${parseInt(result[2], 16)}, ${parseInt(result[3], 16)}` : 
        '0, 0, 0';
}