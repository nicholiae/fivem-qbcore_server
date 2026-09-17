// Tax UI JavaScript
let taxData = null;

// Format currency
function formatCurrency(amount) {
    return '$' + Math.abs(amount).toLocaleString('en-US');
}

// Format vehicle name
function formatVehicleName(vehicleCode) {
    // Convert vehicle code to readable name (e.g., "adder" to "Adder")
    return vehicleCode.charAt(0).toUpperCase() + vehicleCode.slice(1).replace(/_/g, ' ');
}

// Update UI with tax data
function updateTaxUI(data) {
    taxData = data;
    
    // Update current month
    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];
    const currentDate = new Date();
    $('#currentMonth').text(`${monthNames[currentDate.getMonth()]} ${currentDate.getFullYear()}`);
    
    // Update summary values
    $('#totalOwed').text(formatCurrency(data.totalOwed));
    $('#alreadyPaid').text(formatCurrency(data.alreadyPaid));
    
    const netAmount = data.totalOwed - data.alreadyPaid;
    $('#netAmount').text(formatCurrency(netAmount));
    
    // Update net amount styling
    if (netAmount > 0) {
        $('#netAmount').removeClass('negative').addClass('positive');
    } else if (netAmount < 0) {
        $('#netAmount').removeClass('positive').addClass('negative');
    }
    
    $('#daysRemaining').text(data.daysRemaining);
    
    // Update status banner
    updateStatusBanner(data);
    
    // Update breakdown
    updateVehicleBreakdown(data.vehicles);
    updateHouseBreakdown(data.houses);
    updateBusinessBreakdown(data.business);
    
    // Update calculation summary
    updateCalculationSummary(data);
    
    // Update pay button
    updatePayButton(data);
}

// Update status banner
function updateStatusBanner(data) {
    const banner = $('#statusBanner');
    const icon = $('#statusIcon i');
    const text = $('#statusText');
    
    banner.removeClass('success warning danger');
    
    if (data.hasPaid) {
        banner.addClass('success');
        icon.attr('class', 'fas fa-check-circle');
        text.text(`✓ Taxes paid for ${$('#currentMonth').text()}`);
    } else {
        const netAmount = data.totalOwed - data.alreadyPaid;
        if (data.daysRemaining <= 3) {
            banner.addClass('danger');
            icon.attr('class', 'fas fa-exclamation-triangle');
            text.text(`⚠ Only ${data.daysRemaining} day(s) remaining to pay taxes!`);
        } else if (netAmount > 0) {
            banner.addClass('warning');
            icon.attr('class', 'fas fa-info-circle');
            text.text(`You have ${data.daysRemaining} day(s) to pay your taxes of ${formatCurrency(netAmount)}`);
        } else {
            banner.addClass('success');
            icon.attr('class', 'fas fa-hand-holding-usd');
            text.text(`You have a tax credit of ${formatCurrency(Math.abs(netAmount))} to collect`);
        }
    }
}

// Update vehicle breakdown
function updateVehicleBreakdown(vehicles) {
    const vehicleList = $('#vehicleList');
    vehicleList.empty();
    
    if (!vehicles || vehicles.length === 0) {
        vehicleList.html('<div class="empty-state">No vehicles owned</div>');
        $('#vehicleTotal').text('$0');
        return;
    }
    
    let total = 0;
    vehicles.forEach(vehicle => {
        total += vehicle.price;
        vehicleList.append(`
            <div class="item-row">
                <span class="item-name">${formatVehicleName(vehicle.name)}</span>
                <span class="item-value">${formatCurrency(vehicle.price)}</span>
            </div>
        `);
    });
    
    $('#vehicleTotal').text(formatCurrency(total));
}

// Update house breakdown
function updateHouseBreakdown(houses) {
    const houseList = $('#houseList');
    houseList.empty();
    
    if (!houses || houses.length === 0) {
        houseList.html('<div class="empty-state">No properties owned</div>');
        $('#houseTotal').text('$0');
        return;
    }
    
    let total = 0;
    houses.forEach(house => {
        total += house.price;
        houseList.append(`
            <div class="item-row">
                <span class="item-name">${house.name}</span>
                <span class="item-value">${formatCurrency(house.price)}</span>
            </div>
        `);
    });
    
    $('#houseTotal').text(formatCurrency(total));
}

// Update business breakdown
function updateBusinessBreakdown(business) {
    const businessList = $('#businessList');
    businessList.empty();
    
    if (!business || business.length === 0) {
        businessList.html('<div class="empty-state">No business ownership</div>');
        $('#businessTotal').text('$0');
        return;
    }
    
    let total = 0;
    business.forEach(job => {
        total += job.taxAdjustment;
        const adjustmentText = job.taxAdjustment >= 0 ? '+' + formatCurrency(job.taxAdjustment) : '-' + formatCurrency(Math.abs(job.taxAdjustment));
        businessList.append(`
            <div class="item-row">
                <span class="item-name">${job.name} (${job.isBoss ? 'Boss' : 'Employee'})</span>
                <span class="item-value ${job.taxAdjustment >= 0 ? '' : 'negative'}">${adjustmentText}</span>
            </div>
        `);
    });
    
    $('#businessTotal').text(total >= 0 ? '+' + formatCurrency(total) : '-' + formatCurrency(Math.abs(total)));
}

// Update calculation summary
function updateCalculationSummary(data) {
    const totalAssetValue = (data.totalVehicleValue || 0) + (data.totalHouseValue || 0);
    const baseTax = Math.floor(totalAssetValue * 0.07);
    const businessAdjustment = data.businessAdjustment || 0;
    const finalTax = data.totalOwed;
    
    $('#totalAssetValue').text(formatCurrency(totalAssetValue));
    $('#baseTax').text(formatCurrency(baseTax));
    
    if (businessAdjustment >= 0) {
        $('#businessAdjustment').text('+' + formatCurrency(businessAdjustment));
    } else {
        $('#businessAdjustment').text('-' + formatCurrency(Math.abs(businessAdjustment)));
    }
    
    $('#finalTax').text(formatCurrency(finalTax));
}

// Update pay button
function updatePayButton(data) {
    const payBtn = $('#payTaxesBtn');
    const netAmount = data.totalOwed - data.alreadyPaid;
    
    if (data.hasPaid) {
        payBtn.prop('disabled', true);
        payBtn.html('<i class="fas fa-check"></i> Taxes Already Paid');
    } else if (netAmount < 0) {
        payBtn.prop('disabled', false);
        payBtn.html('<i class="fas fa-hand-holding-usd"></i> Collect Tax Credit');
    } else {
        payBtn.prop('disabled', false);
        payBtn.html('<i class="fas fa-credit-card"></i> Pay Taxes Now');
    }
}

// Toggle breakdown section
$('#toggleBreakdown').click(function() {
    $(this).toggleClass('active');
    $('#breakdownContent').toggleClass('active');
});

// Close UI
$('#closeTaxUI').click(function() {
    $.post('https://NS-Taxes/closeTaxUI', JSON.stringify({}));
});

// Pay taxes button
$('#payTaxesBtn').click(function() {
    if ($(this).prop('disabled')) return;
    
    $.post('https://NS-Taxes/payTaxes', JSON.stringify({}), function(response) {
        if (response.success) {
            // Refresh tax data
            $.post('https://NS-Taxes/getTaxData', JSON.stringify({}), function(data) {
                updateTaxUI(data);
            });
        }
    });
});

// Listen for NUI messages
window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'openTaxUI') {
        $('body').fadeIn(300);
        if (data.taxData) {
            updateTaxUI(data.taxData);
        }
    } else if (data.action === 'closeTaxUI') {
        $('body').fadeOut(300);
    } else if (data.action === 'updateTaxData') {
        updateTaxUI(data.taxData);
    }
});

// Close on ESC key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        $.post('https://NS-Taxes/closeTaxUI', JSON.stringify({}));
    }
});

// Initialize - hide by default
$(document).ready(function() {
    $('body').hide();
    
    // Expand breakdown by default
    $('#toggleBreakdown').addClass('active');
    $('#breakdownContent').addClass('active');
});