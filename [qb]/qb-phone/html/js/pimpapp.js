let pimpAppData = null;

// Initialize Pimp App
function SetupPimpApp(data) {
    pimpAppData = data;
    
    // Update header
    updateMultiplierDisplay(data.multiplier, data.baseMultiplier, data.relationshipBonus, data.maxMultiplier);
    
    // Load tabs
    loadRelationships(data.relationships);
    loadStatistics(data.statistics);
    loadLeaderboard(data.leaderboard);
}

// Update multiplier display
function updateMultiplierDisplay(total, base, bonus, max) {
    $('.multiplier-value').text(total.toFixed(2) + 'x');
    $('.multiplier-max').text('/ ' + max.toFixed(1) + 'x');
    
    let percentage = (total / max) * 100;
    $('.progress-bar-fill').css('width', percentage + '%');
    
    $('.breakdown-item:eq(0) .breakdown-value').text(base.toFixed(2) + 'x');
    $('.breakdown-item:eq(1) .breakdown-value').text('+' + bonus.toFixed(2) + 'x');
}

// Load relationships
function loadRelationships(relationships) {
    $('.relationship-cards').empty();
    
    if (!relationships || relationships.length === 0) {
        $('.relationship-cards').html(`
            <div class="empty-state">
                <i class="fas fa-heart-broken"></i>
                <div class="empty-state-text">No Relationships Yet</div>
                <div class="empty-state-subtext">Start building relationships to earn bonuses!</div>
            </div>
        `);
        return;
    }
    
    relationships.forEach(function(rel) {
        let card = createRelationshipCard(rel);
        $('.relationship-cards').append(card);
    });
}

// Create relationship card
function createRelationshipCard(rel) {
    let timeSince = getTimeSince(rel.last_interaction);
    let tierColor = getTierColor(rel.tier);
    let successRate = rel.total_interactions > 0 ? 
        Math.round((rel.successful_interactions / rel.total_interactions) * 100) : 0;
    
    return `
        <div class="relationship-card">
            <div class="card-header">
                <div class="card-image">
                    <i class="fas fa-user"></i>
                    <div class="tier-badge" style="background: ${tierColor}">
                        ${rel.relationship_status}
                    </div>
                </div>
                <div class="card-info">
                    <h3 class="prostitute-name">${rel.prostitute_name}</h3>
                    <p class="prostitute-nickname">${rel.nickname || 'Unknown'}</p>
                </div>
            </div>
            <div class="reputation-section">
                <div class="reputation-bar">
                    <div class="rep-fill" style="width: ${rel.reputation}%"></div>
                    <span class="rep-text">${rel.reputation}/100</span>
                </div>
            </div>
            <div class="card-stats">
                <div class="stat-item">
                    <span class="stat-label">Bonus</span>
                    <span class="stat-value bonus-highlight">+${rel.bonus_multiplier.toFixed(2)}x</span>
                </div>
                <div class="stat-item">
                    <span class="stat-label">Interactions</span>
                    <span class="stat-value">${rel.total_interactions}</span>
                </div>
                <div class="stat-item">
                    <span class="stat-label">Success</span>
                    <span class="stat-value">${successRate}%</span>
                </div>
            </div>
            <div class="last-seen">Last seen: ${timeSince}</div>
        </div>
    `;
}

// Load statistics
function loadStatistics(stats) {
    if (!stats) {
        stats = {
            total_solicitations: 0,
            successful_solicitations: 0,
            failed_solicitations: 0,
            perfect_matches: 0,
            times_robbed: 0,
            total_spent: 0,
            active_relationships: 0,
            highest_multiplier: 1.0,
            total_reputation: 0
        };
    }
    
    let successRate = stats.total_solicitations > 0 ? 
        Math.round((stats.successful_solicitations / stats.total_solicitations) * 100) : 0;
    
    $('.stats-grid').html(`
        <div class="stat-box">
            <i class="fas fa-handshake stat-box-icon"></i>
            <span class="stat-box-label">Total Interactions</span>
            <span class="stat-box-value">${stats.total_solicitations}</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-percentage stat-box-icon"></i>
            <span class="stat-box-label">Success Rate</span>
            <span class="stat-box-value">${successRate}%</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-check-circle stat-box-icon"></i>
            <span class="stat-box-label">Successful</span>
            <span class="stat-box-value">${stats.successful_solicitations}</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-times-circle stat-box-icon"></i>
            <span class="stat-box-label">Failed</span>
            <span class="stat-box-value">${stats.failed_solicitations}</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-star stat-box-icon"></i>
            <span class="stat-box-label">Perfect Matches</span>
            <span class="stat-box-value">${stats.perfect_matches}</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-mask stat-box-icon"></i>
            <span class="stat-box-label">Times Robbed</span>
            <span class="stat-box-value">${stats.times_robbed}</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-dollar-sign stat-box-icon"></i>
            <span class="stat-box-label">Total Spent</span>
            <span class="stat-box-value">$${formatMoney(stats.total_spent)}</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-heart stat-box-icon"></i>
            <span class="stat-box-label">Active Girls</span>
            <span class="stat-box-value">${stats.active_relationships}/4</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-chart-line stat-box-icon"></i>
            <span class="stat-box-label">Highest Multi</span>
            <span class="stat-box-value">${stats.highest_multiplier.toFixed(2)}x</span>
        </div>
        <div class="stat-box">
            <i class="fas fa-fire stat-box-icon"></i>
            <span class="stat-box-label">Total Rep</span>
            <span class="stat-box-value">${stats.total_reputation}</span>
        </div>
    `);
}

// Load leaderboard
function loadLeaderboard(leaderboard) {
    $('.leaderboard-list').empty();
    
    if (!leaderboard || leaderboard.length === 0) {
        $('.leaderboard-list').html(`
            <div class="empty-state">
                <i class="fas fa-trophy"></i>
                <div class="empty-state-text">No Leaderboard Data</div>
                <div class="empty-state-subtext">Be the first to climb the ranks!</div>
            </div>
        `);
        return;
    }
    
    leaderboard.forEach(function(entry, index) {
        let item = createLeaderboardItem(entry, index + 1);
        $('.leaderboard-list').append(item);
    });
}

// Create leaderboard item
function createLeaderboardItem(entry, rank) {
    let rankClass = '';
    if (rank === 1) rankClass = 'gold';
    else if (rank === 2) rankClass = 'silver';
    else if (rank === 3) rankClass = 'bronze';
    
    let itemClass = 'leaderboard-item';
    if (rank <= 3) itemClass += ' top-3';
    if (entry.isYou) itemClass += ' you';
    
    let relationshipText = entry.active_relationships > 0 ? 
        `${entry.active_relationships}/4 Active` : 'No relationships';
    
    return `
        <div class="${itemClass}">
            <span class="rank ${rankClass}">#${rank}</span>
            <div class="player-info">
                <div class="player-name">${entry.isYou ? 'You' : entry.name}</div>
                <div class="player-relationships">${relationshipText}</div>
            </div>
            <span class="leaderboard-multiplier">${entry.current_multiplier.toFixed(2)}x</span>
        </div>
    `;
}

// Helper functions
function getTierColor(tier) {
    const colors = {
        1: '#95a5a6',
        2: '#3498db',
        3: '#9b59b6',
        4: '#e91e63',
        5: '#f39c12'
    };
    return colors[tier] || '#95a5a6';
}

function getTimeSince(timestamp) {
    if (!timestamp) return 'Never';
    
    let now = new Date();
    let then = new Date(timestamp);
    let diff = Math.floor((now - then) / 1000); // seconds
    
    if (diff < 60) return 'Just now';
    if (diff < 3600) return Math.floor(diff / 60) + ' minutes ago';
    if (diff < 86400) return Math.floor(diff / 3600) + ' hours ago';
    if (diff < 604800) return Math.floor(diff / 86400) + ' days ago';
    return Math.floor(diff / 604800) + ' weeks ago';
}

function formatMoney(amount) {
    if (amount >= 1000000) {
        return (amount / 1000000).toFixed(1) + 'M';
    } else if (amount >= 1000) {
        return (amount / 1000).toFixed(1) + 'K';
    }
    return amount.toString();
}

// Tab switching
$(document).on('click', '.pimpapp-tab', function() {
    let tabName = $(this).data('tab');
    
    // Update active tab
    $('.pimpapp-tab').removeClass('active');
    $(this).addClass('active');
    
    // Show corresponding content
    $('.pimpapp-content').addClass('hidden');
    $('#pimpapp-' + tabName).removeClass('hidden');
});