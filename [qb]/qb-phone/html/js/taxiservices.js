// Taxi Services App Functions
function CallTaxiServices(){
    $('.phone-home-container').click();
}

// Call Taxi Button
$(document).on('click', '#call-taxi-button', function(e){
    e.preventDefault();
    $.post('https://qb-phone/CallTaxi', JSON.stringify({}), function(status){
        // Handle response if needed
    });
});

// Dismiss Taxi Button
$(document).on('click', '#dismiss-taxi-button', function(e){
    e.preventDefault();
    $.post('https://qb-phone/DismissTaxi', JSON.stringify({}), function(status){
        // Handle response if needed
    });
});

// Reset Taxi Button
$(document).on('click', '#reset-taxi-button', function(e){
    e.preventDefault();
    $.post('https://qb-phone/ResetTaxi', JSON.stringify({}), function(status){
        // Handle response if needed
    });
});

// Back Button
$(document).on('click', '#taxiservices-back-button', function(e){
    e.preventDefault();
    QB.Phone.Functions.Close();
});