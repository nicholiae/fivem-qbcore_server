// =============================================
// FIVEM WATERMARK MODULE - JAVASCRIPT
// =============================================

// DOM Elements
var watermarkContainer = document.getElementById('watermark-container');
var watermark = document.getElementById('watermark');
var menuContainer = document.getElementById('menu-container');
var menuOverlay = document.getElementById('menu-overlay');
var closeBtn = document.getElementById('close-btn');
var tabsNav = document.getElementById('tabs-nav');

// =============================================
// EVENT LISTENERS
// =============================================

document.addEventListener('DOMContentLoaded', function() {
    console.log('[Watermark] DOM loaded, setting up event listeners');
    
    // Close button click
    if (closeBtn) {
        closeBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            console.log('[Watermark] Close button clicked');
            closeMenu();
        });
    }
    
    // Overlay click (click outside menu to close)
    if (menuOverlay) {
        menuOverlay.addEventListener('click', function(e) {
            if (e.target === menuOverlay) {
                e.preventDefault();
                e.stopPropagation();
                console.log('[Watermark] Overlay clicked');
                closeMenu();
            }
        });
    }
    
    // Tab navigation
    if (tabsNav) {
        tabsNav.addEventListener('click', function(e) {
            var tabBtn = e.target.closest('.tab-btn');
            if (tabBtn) {
                switchTab(tabBtn.dataset.tab);
            }
        });
    }
});

// =============================================
// MENU FUNCTIONS
// =============================================

function closeMenu() {
    console.log('[Watermark] closeMenu() called');
    
    // Hide the menu UI
    if (menuOverlay) menuOverlay.classList.remove('active');
    if (menuContainer) menuContainer.classList.remove('active');
    
    // Get the resource name
    var resourceName = getResourceName();
    console.log('[Watermark] Resource name:', resourceName);
    
    if (resourceName) {
        var url = 'https://' + resourceName + '/closeMenu';
        console.log('[Watermark] Calling NUI callback:', url);
        
        fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({})
        })
        .then(function(response) {
            console.log('[Watermark] NUI callback response:', response.status);
            return response.text();
        })
        .then(function(text) {
            console.log('[Watermark] NUI callback result:', text);
        })
        .catch(function(err) {
            console.error('[Watermark] NUI callback error:', err);
        });
    } else {
        console.error('[Watermark] Could not get resource name!');
    }
}

function switchTab(tabId) {
    // Update buttons
    document.querySelectorAll('.tab-btn').forEach(function(btn) {
        btn.classList.toggle('active', btn.dataset.tab === tabId);
    });
    // Update panes
    document.querySelectorAll('.tab-pane').forEach(function(pane) {
        pane.classList.toggle('active', pane.id === tabId + '-tab');
    });
}

// =============================================
// NUI MESSAGE HANDLER
// =============================================

window.addEventListener('message', function(event) {
    var data = event.data;
    if (!data.action) return;
    
    console.log('[Watermark] NUI message received:', data.action);
    
    switch (data.action) {
        case 'init':
            break;
            
        case 'toggleWatermark':
            if (watermarkContainer) {
                watermarkContainer.classList.toggle('hidden', !data.visible);
            }
            break;
            
        case 'openMenu':
            console.log('[Watermark] Opening menu');
            if (menuOverlay) menuOverlay.classList.add('active');
            if (menuContainer) menuContainer.classList.add('active');
            break;
            
        case 'closeMenu':
            console.log('[Watermark] Closing menu via NUI message');
            if (menuOverlay) menuOverlay.classList.remove('active');
            if (menuContainer) menuContainer.classList.remove('active');
            break;
    }
});

// =============================================
// UTILITY FUNCTIONS
// =============================================

function getResourceName() {
    // In FiveM NUI, the resource name is available via GetParentResourceName()
    // This is a global function provided by FiveM
    if (typeof GetParentResourceName === 'function') {
        try {
            return GetParentResourceName();
        } catch (e) {
            console.error('[Watermark] Error calling GetParentResourceName:', e);
        }
    }
    
    // Fallback - try to parse from URL
    try {
        var path = window.location.pathname;
        var match = path.match(/\/nui\/([^\/]+)\//);
        if (match && match[1]) {
            return match[1];
        }
    } catch (e) {
        console.error('[Watermark] Error parsing resource name from URL:', e);
    }
    
    // Last resort - hardcoded resource name
    console.error('[Watermark] Could not determine resource name, using fallback');
    return 'fivem-watermark';
}