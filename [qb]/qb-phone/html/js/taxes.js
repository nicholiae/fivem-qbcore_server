// Tax App JavaScript for QB-Phone

var TaxesApp = {};

TaxesApp.formatCurrency = function(amount) {
    return '$' + Math.abs(amount).toLocaleString('en-US');
};

TaxesApp.formatVehicleName = function(vehicleCode) {
    return vehicleCode.charAt(0).toUpperCase() + vehicleCode.slice(1).replace(/_/g, ' ');
};

TaxesApp.updateUI = function(data) {
    // Update current month
    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];
    const currentDate = new Date();
    $('.taxes-month-badge').text(`${monthNames[currentDate.getMonth()]} ${currentDate.getFullYear()}`);
    
    // Update summary values
    $('#taxes-total-owed').text(TaxesApp.formatCurrency(data.totalOwed));
    $('#taxes-already-paid').text(TaxesApp.formatCurrency(data.alreadyPaid));
    
    const netAmount = data.totalOwed - data.alreadyPaid;
    $('#taxes-net-amount').text(TaxesApp.formatCurrency(netAmount));
    $('#taxes-days-remaining').text(data.daysRemaining);
    
    // Update status banner
    TaxesApp.updateStatusBanner(data);
    
    // Update breakdown
    TaxesApp.updateVehicleBreakdown(data.vehicles);
    TaxesApp.updateHouseBreakdown(data.houses);
    TaxesApp.updateBusinessBreakdown(data.business);
    
    // Update pay button
    TaxesApp.updatePayButton(data);
};

TaxesApp.updateStatusBanner = function(data) {
    const banner = $('.taxes-status-banner');
    const icon = $('.taxes-status-icon i');
    const text = $('.taxes-status-text');
    
    banner.removeClass('success warning danger');
    
    if (data.hasPaid) {
        banner.addClass('success');
        icon.attr('class', 'fas fa-check-circle');
        text.text('✓ Taxes paid for this month');
    } else {
        const netAmount = data.totalOwed - data.alreadyPaid;
        if (data.daysRemaining <= 3) {
            banner.addClass('danger');
            icon.attr('class', 'fas fa-exclamation-triangle');
            text.text(`⚠ Only ${data.daysRemaining} day(s) remaining!`);
        } else if (netAmount > 0) {
            banner.addClass('warning');
            icon.attr('class', 'fas fa-info-circle');
            text.text(`${data.daysRemaining} day(s) to pay ${TaxesApp.formatCurrency(netAmount)}`);
        } else {
            banner.addClass('success');
            icon.attr('class', 'fas fa-hand-holding-usd');
            text.text(`Tax credit: ${TaxesApp.formatCurrency(Math.abs(netAmount))}`);
        }
    }
};

TaxesApp.updateVehicleBreakdown = function(vehicles) {
    const vehicleList = $('#taxes-vehicle-list');
    vehicleList.empty();
    
    if (!vehicles || vehicles.length === 0) {
        vehicleList.html('<div class="taxes-empty-state">No vehicles owned</div>');
        $('#taxes-vehicle-total').text('$0');
        return;
    }
    
    let total = 0;
    vehicles.forEach(vehicle => {
        total += vehicle.price;
        vehicleList.append(`
            <div class="taxes-item-row">
                <span class="taxes-item-name">${TaxesApp.formatVehicleName(vehicle.name)}</span>
                <span class="taxes-item-value">${TaxesApp.formatCurrency(vehicle.price)}</span>
            </div>
        `);
    });
    
    $('#taxes-vehicle-total').text(TaxesApp.formatCurrency(total));
};

TaxesApp.updateHouseBreakdown = function(houses) {
    const houseList = $('#taxes-house-list');
    houseList.empty();
    
    if (!houses || houses.length === 0) {
        houseList.html('<div class="taxes-empty-state">No properties owned</div>');
        $('#taxes-house-total').text('$0');
        return;
    }
    
    let total = 0;
    houses.forEach(house => {
        total += house.price;
        houseList.append(`
            <div class="taxes-item-row">
                <span class="taxes-item-name">${house.name}</span>
                <span class="taxes-item-value">${TaxesApp.formatCurrency(house.price)}</span>
            </div>
        `);
    });
    
    $('#taxes-house-total').text(TaxesApp.formatCurrency(total));
};

TaxesApp.updateBusinessBreakdown = function(business) {
    const businessList = $('#taxes-business-list');
    businessList.empty();
    
    if (!business || business.length === 0) {
        businessList.html('<div class="taxes-empty-state">No business ownership</div>');
        $('#taxes-business-total').text('$0');
        return;
    }
    
    let total = 0;
    business.forEach(job => {
        total += job.taxAdjustment;
        const adjustmentText = job.taxAdjustment >= 0 ? 
            '+' + TaxesApp.formatCurrency(job.taxAdjustment) : 
            '-' + TaxesApp.formatCurrency(Math.abs(job.taxAdjustment));
        businessList.append(`
            <div class="taxes-item-row">
                <span class="taxes-item-name">${job.name}</span>
                <span class="taxes-item-value">${adjustmentText}</span>
            </div>
        `);
    });
    
    const totalText = total >= 0 ? 
        '+' + TaxesApp.formatCurrency(total) : 
        '-' + TaxesApp.formatCurrency(Math.abs(total));
    $('#taxes-business-total').text(totalText);
};

TaxesApp.updatePayButton = function(data) {
    const payBtn = $('#taxes-pay-btn');
    const netAmount = data.totalOwed - data.alreadyPaid;
    
    if (data.hasPaid) {
        payBtn.prop('disabled', true);
        payBtn.html('<i class="fas fa-check"></i> Already Paid');
    } else if (netAmount < 0) {
        payBtn.prop('disabled', false);
        payBtn.html('<i class="fas fa-hand-holding-usd"></i> Collect Credit');
    } else {
        payBtn.prop('disabled', false);
        payBtn.html('<i class="fas fa-credit-card"></i> Pay Now');
    }
};

TaxesApp.Open = function(data) {
    QB.Phone.Animations.TopSlideDown('.taxes-app', 400, 0);
    
    if (data && data.taxData) {
        TaxesApp.updateUI(data.taxData);
    } else {
        // Show loading state
        $('.taxes-content').html(`
            <div class="taxes-loading">
                <i class="fas fa-spinner"></i>
                <div class="taxes-loading-text">Loading tax information...</div>
            </div>
        `);
        
        // Request tax data
        $.post('https://qb-phone/GetTaxData', JSON.stringify({}), function(taxData) {
            // Restore content
            TaxesApp.RestoreContent();
            TaxesApp.updateUI(taxData);
        });
    }
};

TaxesApp.Close = function() {
    QB.Phone.Animations.TopSlideUp('.taxes-app', 400, -160);
};

TaxesApp.RestoreContent = function() {
    $('.taxes-content').html(`
        <div class="taxes-summary-card">
            <div class="taxes-card-header">
                <h3>Tax Summary</h3>
                <span class="taxes-month-badge">January 2025</span>
            </div>
            
            <div class="taxes-summary-grid">
                <div class="taxes-summary-item">
                    <span class="label">Total Owed</span>
                    <span class="value" id="taxes-total-owed">$0</span>
                </div>
                <div class="taxes-summary-item">
                    <span class="label">Already Paid</span>
                    <span class="value" id="taxes-already-paid">$0</span>
                </div>
                <div class="taxes-summary-item highlight">
                    <span class="label">Net Amount</span>
                    <span class="value" id="taxes-net-amount">$0</span>
                </div>
                <div class="taxes-summary-item">
                    <span class="label">Days Left</span>
                    <span class="value" id="taxes-days-remaining">0</span>
                </div>
            </div>

            <button class="taxes-pay-btn" id="taxes-pay-btn">
                <i class="fas fa-credit-card"></i>
                Pay Taxes Now
            </button>
        </div>

        <div class="taxes-breakdown-section">
            <div class="taxes-section-header" id="taxes-toggle-breakdown">
                <h3>Tax Breakdown</h3>
                <button class="taxes-toggle-btn">
                    <i class="fas fa-chevron-down"></i>
                </button>
            </div>
            
            <div class="taxes-breakdown-content" id="taxes-breakdown-content">
                <div class="taxes-breakdown-category">
                    <div class="taxes-category-header">
                        <i class="fas fa-car"></i>
                        <h4>Vehicles</h4>
                        <span class="taxes-category-total" id="taxes-vehicle-total">$0</span>
                    </div>
                    <div class="taxes-category-items" id="taxes-vehicle-list">
                        <div class="taxes-empty-state">No vehicles owned</div>
                    </div>
                </div>

                <div class="taxes-breakdown-category">
                    <div class="taxes-category-header">
                        <i class="fas fa-home"></i>
                        <h4>Properties</h4>
                        <span class="taxes-category-total" id="taxes-house-total">$0</span>
                    </div>
                    <div class="taxes-category-items" id="taxes-house-list">
                        <div class="taxes-empty-state">No properties owned</div>
                    </div>
                </div>

                <div class="taxes-breakdown-category">
                    <div class="taxes-category-header">
                        <i class="fas fa-briefcase"></i>
                        <h4>Business</h4>
                        <span class="taxes-category-total" id="taxes-business-total">$0</span>
                    </div>
                    <div class="taxes-category-items" id="taxes-business-list">
                        <div class="taxes-empty-state">No business ownership</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="taxes-info-section">
            <h4>How Taxes Work</h4>
            <ul>
                <li>7% tax on total asset value</li>
                <li>Business owners: +$500k</li>
                <li>City job bosses: -$1M credit</li>
                <li>Due by end of month</li>
                <li>Unpaid = repossession risk</li>
            </ul>
        </div>
    `);
    
    // Re-bind events
    TaxesApp.BindEvents();
};

TaxesApp.BindEvents = function() {
    // Toggle breakdown
    $(document).off('click', '#taxes-toggle-breakdown').on('click', '#taxes-toggle-breakdown', function() {
        $(this).find('.taxes-toggle-btn').toggleClass('active');
        $('#taxes-breakdown-content').toggleClass('active');
    });
    
    // Pay taxes button
    $(document).off('click', '#taxes-pay-btn').on('click', '#taxes-pay-btn', function() {
        if ($(this).prop('disabled')) return;
        
        $.post('https://qb-phone/PayTaxes', JSON.stringify({}), function(response) {
            if (response && response.success) {
                // Refresh tax data
                $.post('https://qb-phone/GetTaxData', JSON.stringify({}), function(taxData) {
                    TaxesApp.updateUI(taxData);
                });
            }
        });
    });
};

// Initialize
$(document).ready(function() {
    TaxesApp.BindEvents();
});