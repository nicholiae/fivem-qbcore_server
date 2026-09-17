// AutoPilot App - Button Event Handlers
// Note: The app registration is handled by config.lua on the server side

// Track when app is opened to request current status
var autopilotAppOpen = false;
var lastUIUpdateTime = 0;
var UI_UPDATE_DEBOUNCE = 100; // milliseconds

// Listen for app opening
$(document).on('click', '[data-appname="autopilot"]', function(e) {
    if (!autopilotAppOpen) {
        autopilotAppOpen = true;
        // Request current autopilot status when app opens
        $.post('https://qb-phone/AutoPilotAppOpened', JSON.stringify({}));
    }
});

// Listen for app closing
$(document).on('click', '.phone-home-button', function(e) {
    autopilotAppOpen = false;
});

// Use event delegation for dynamically loaded elements
$(document).on('click', '#autopilot-toggle', function(e) {
    e.preventDefault();
    console.log("AutoPilot toggle clicked");
    $.post('https://qb-phone/AutoPilotToggle', JSON.stringify({}));
});

$(document).on('click', '#autopilot-speed-up', function(e) {
    e.preventDefault();
    console.log("Speed up clicked");
    $.post('https://qb-phone/AutoPilotSpeedUp', JSON.stringify({}));
});

$(document).on('click', '#autopilot-speed-down', function(e) {
    e.preventDefault();
    console.log("Speed down clicked");
    $.post('https://qb-phone/AutoPilotSpeedDown', JSON.stringify({}));
});

$(document).on('click', '#autopilot-gps-mode', function(e) {
    e.preventDefault();
    console.log("GPS mode clicked");
    $.post('https://qb-phone/AutoPilotSetGPSMode', JSON.stringify({}));
});

$(document).on('click', '#autopilot-wander-mode', function(e) {
    e.preventDefault();
    console.log("Wander mode clicked");
    $.post('https://qb-phone/AutoPilotSetWanderMode', JSON.stringify({}));
});

$(document).on('click', '#autopilot-set-gps', function(e) {
    e.preventDefault();
    console.log("Set GPS clicked");
    $.post('https://qb-phone/AutoPilotSetGPSDestination', JSON.stringify({}));
});

$(document).on('click', '#autopilot-stop', function(e) {
    e.preventDefault();
    console.log("Stop AutoPilot clicked");
    $.post('https://qb-phone/AutoPilotStop', JSON.stringify({}));
});

$(document).on('click', '#autopilot-robot-icon', function(e) {
    e.preventDefault();
    console.log("Robot icon clicked - Errr44 mode toggle");
    $.post('https://qb-phone/AutoPilotToggleErrr44', JSON.stringify({}));
});

// Setup AutoPilot app with current status (can be called from server)
SetupAutoPilotApp = function(data) {
    // Debounce UI updates to prevent rapid-fire calls
    var currentTime = Date.now();
    if (currentTime - lastUIUpdateTime < UI_UPDATE_DEBOUNCE) {
        console.log("UI update debounced");
        return;
    }
    lastUIUpdateTime = currentTime;
    
    console.log("Setting up AutoPilot app with data:", data);
    
    // Update status display
    if (data.active) {
        $(".autopilot-header .status").html('<span class="status-indicator"></span><span>ACTIVE - ' + (data.mode === 'wander' ? 'WANDER MODE' : 'GPS MODE') + '</span>');
        $(".autopilot-header .status").css('color', '#4ade80');
        $(".autopilot-header .status .status-indicator").css('background', '#4ade80');
    } else {
        $(".autopilot-header .status").html('<span class="status-indicator"></span><span>INACTIVE</span>');
        $(".autopilot-header .status").css('color', '#ef4444');
        $(".autopilot-header .status .status-indicator").css('background', '#ef4444');
    }
    
    // Update speed display
    $("#autopilot-speed-value").text(data.speed + " MPH");
    
    // Update mode buttons
    if (data.mode === 'gps') {
        $("#autopilot-gps-mode").addClass('active');
        $("#autopilot-wander-mode").removeClass('active');
    } else if (data.mode === 'wander') {
        $("#autopilot-wander-mode").addClass('active');
        $("#autopilot-gps-mode").removeClass('active');
    }
    
    // Update Errr44 mode visuals
    if (data.errr44) {
        $(".phone-application-container").addClass('error-mode');
        $(".autopilot-header .status").html('<span class="status-indicator"></span><span>AcTiVe - ErRr44 MoDe</span>');
        $(".autopilot-header .status").css('color', '#ef4444');
        $(".autopilot-header .status .status-indicator").css('background', '#ef4444');
    } else {
        $(".phone-application-container").removeClass('error-mode');
        if (data.active) {
            $(".autopilot-header .status").html('<span class="status-indicator"></span><span>ACTIVE - ' + (data.mode === 'wander' ? 'WANDER MODE' : 'GPS MODE') + '</span>');
            $(".autopilot-header .status").css('color', '#4ade80');
            $(".autopilot-header .status .status-indicator").css('background', '#4ade80');
        }
    }
};

console.log("AutoPilot app JavaScript loaded successfully");