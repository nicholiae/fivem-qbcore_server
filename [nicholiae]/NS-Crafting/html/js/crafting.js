// Enhanced Crafting functionality with reactive quantity and filters

let allRecipes = [];
let recipeDatabase = {};
let activeBenchFilter = 'all';
let showAvailableOnly = false;
let searchQuery = '';
let inBonusZone = false;
let currentBenchName = '';

// Listen for crafting data from FiveM
window.addEventListener('message', (event) => {
    const data = event.data;
    
    // Show or hide the crafting interface
    if (data.action === 'show') {
        allRecipes = data.recipes || [];
        inBonusZone = data.inBonusZone || false;
        currentBenchName = data.benchName || 'Crafting Bench';
        
        // Update header
        const benchNameElement = document.getElementById('bench-name');
        if (benchNameElement) {
            benchNameElement.textContent = currentBenchName;
        }
        
        // Show/hide bonus zone indicator
        const bonusIndicator = document.getElementById('bonus-zone-indicator');
        if (bonusIndicator) {
            bonusIndicator.style.display = inBonusZone ? 'inline-block' : 'none';
        }
        
        // Update player XP
        if (data.proficiencyLevels) {
            const xpValue = Object.values(data.proficiencyLevels)[0] || 0;
            const playerXpValue = document.getElementById('player-xp-value');
            if (playerXpValue) {
                playerXpValue.textContent = xpValue;
            }
        }
        
        // Initialize recipe database
        initializeRecipeDatabase(allRecipes);
        
        // Generate bench filters
        generateBenchFilters(allRecipes);
        
        // Update stats
        updateStats();
        
        // Render recipes
        renderRecipes();
        
        // Show container
        const craftingContainer = document.getElementById('crafting-container');
        if (craftingContainer) {
            craftingContainer.style.display = 'flex';
            document.body.style.display = 'block';
        }
    } else if (data.action === 'hide') {
        const craftingContainer = document.getElementById('crafting-container');
        if (craftingContainer) {
            craftingContainer.style.display = 'none';
            document.body.style.display = 'none';
        }
    }
});

// Initialize recipe database
function initializeRecipeDatabase(recipes) {
    recipeDatabase = {};
    recipes.forEach(recipe => {
        const recipeId = recipe.name;
        recipeDatabase[recipeId] = {
            ...recipe,
            currentQuantity: 1,
            baseIngredients: recipe.ingredients.map(ing => ({...ing}))
        };
    });
}

// Generate bench filters dynamically
function generateBenchFilters(recipes) {
    const benchFiltersContainer = document.getElementById('bench-filters');
    if (!benchFiltersContainer) return;
    
    // Get unique bench types
    const benchTypes = [...new Set(recipes.map(r => r.benchType))];
    
    // Bench icons mapping
    const benchIcons = {
        unemployed: '📝',
        lux: '💎',
        joint: '🌿',
        blunt: '🚬',
        pets: '🐾',
        rustybrowns: '☕',
        tequilala: '🍹',
        bigjohns: '🍔',
        drivein: '🍿',
        burgershot: '🍟',
        butcher: '🔪',
        bikes: '🚲',
        pjsauto: '🚗',
        mechj: '🔧',
        tuners: '⚙️',
        customs: '🎨',
        cookies: '🍪',
        whitewidow: '🌱',
        weedshop: '🌿',
        ballas: '🔵',
        syndicate: '🔴',
        abk: '🟢',
        otf: '🟡',
        lostmc: '🏍️',
        police: '🚓',
        gang: '🔫'
    };
    
    let html = '';
    benchTypes.forEach(benchType => {
        const count = recipes.filter(r => r.benchType === benchType).length;
        const icon = benchIcons[benchType] || '📦';
        const displayName = benchType.charAt(0).toUpperCase() + benchType.slice(1);
        
        html += `
            <div class="proficiency-item ${benchType}" data-bench="${benchType}" onclick="toggleBenchFilter('${benchType}')">
                <div class="proficiency-name">${icon} ${displayName}</div>
                <div class="proficiency-count" id="${benchType}-count">${count}</div>
            </div>
        `;
    });
    
    benchFiltersContainer.innerHTML = html;
}

// Update stats
function updateStats() {
    const totalRecipes = document.getElementById('total-recipes');
    const availableRecipes = document.getElementById('available-recipes');
    
    if (totalRecipes) {
        totalRecipes.textContent = allRecipes.length;
    }
    
    if (availableRecipes) {
        const availableCount = allRecipes.filter(r => r.available).length;
        availableRecipes.textContent = availableCount;
    }
}

// Set filter (All Recipes button)
function setFilter(filter) {
    activeBenchFilter = filter;
    
    // Update button states
    const allBtn = document.getElementById('filter-all');
    if (allBtn) {
        allBtn.classList.add('active');
    }
    
    // Remove active from bench filters
    document.querySelectorAll('.proficiency-item').forEach(item => {
        item.classList.remove('filter-active');
    });
    
    renderRecipes();
}

// Toggle bench filter
function toggleBenchFilter(benchType) {
    if (activeBenchFilter === benchType) {
        // Deselect - go back to all
        activeBenchFilter = 'all';
        document.querySelectorAll('.proficiency-item').forEach(item => {
            item.classList.remove('filter-active');
        });
        document.getElementById('filter-all').classList.add('active');
    } else {
        // Select this bench
        activeBenchFilter = benchType;
        document.querySelectorAll('.proficiency-item').forEach(item => {
            item.classList.remove('filter-active');
        });
        const selectedBench = document.querySelector(`.proficiency-item[data-bench="${benchType}"]`);
        if (selectedBench) {
            selectedBench.classList.add('filter-active');
        }
        document.getElementById('filter-all').classList.remove('active');
    }
    
    renderRecipes();
}

// Toggle available filter
function toggleAvailableFilter() {
    showAvailableOnly = !showAvailableOnly;
    const toggleBtn = document.getElementById('availableToggle');
    if (toggleBtn) {
        toggleBtn.classList.toggle('active');
    }
    renderRecipes();
}

// Search functionality
const searchInput = document.getElementById('recipe-search');
if (searchInput) {
    searchInput.addEventListener('input', (e) => {
        searchQuery = e.target.value.toLowerCase();
        renderRecipes();
    });
}

// Render recipes with filters
function renderRecipes() {
    let filteredRecipes = [...allRecipes];
    
    // Apply bench filter
    if (activeBenchFilter !== 'all') {
        filteredRecipes = filteredRecipes.filter(r => r.benchType === activeBenchFilter);
    }
    
    // Apply available filter
    if (showAvailableOnly) {
        filteredRecipes = filteredRecipes.filter(r => r.available === true);
    }
    
    // Apply search filter
    if (searchQuery) {
        filteredRecipes = filteredRecipes.filter(r => 
            r.displayName.toLowerCase().includes(searchQuery) ||
            r.name.toLowerCase().includes(searchQuery)
        );
    }
    
    // Render filtered recipes
    displayRecipes(filteredRecipes);
}

// Display recipes in grid
function displayRecipes(recipes) {
    const recipeGrid = document.getElementById('recipe-grid');
    if (!recipeGrid) return;
    
    if (recipes.length === 0) {
        recipeGrid.innerHTML = '<div style="text-align: center; padding: 40px; color: #999; width: 100%;">No recipes found</div>';
        return;
    }
    
    recipeGrid.innerHTML = '';
    recipes.forEach(recipe => {
        const card = createRecipeCard(recipe);
        recipeGrid.appendChild(card);
    });
}

// Create recipe card
function createRecipeCard(recipe) {
    const card = document.createElement('div');
    card.className = 'recipe-card';
    card.setAttribute('data-craftable', recipe.available);
    card.setAttribute('data-recipe-id', recipe.name);
    
    if (recipe.bonusActive) {
        card.classList.add('bonus-active');
    }
    
    // Build ingredients HTML
    let ingredientsHTML = '<div class="recipe-ingredients">';
    recipe.ingredients.forEach(ingredient => {
        const isSufficient = ingredient.available >= ingredient.required;
        const statusIcon = isSufficient ? '✓' : '⚠️';
        const missingAmount = isSufficient ? 0 : ingredient.required - ingredient.available;
        
        ingredientsHTML += `
            <div class="ingredient-item" data-sufficient="${isSufficient}">
                <img src="${ingredient.icon}" class="ingredient-icon" alt="${ingredient.name}" onerror="this.src='https://via.placeholder.com/36'">
                <div class="ingredient-info">
                    <span class="ingredient-name">${ingredient.name}</span>
                    <span class="ingredient-count ${isSufficient ? '' : 'insufficient'}">
                        <span class="available">${ingredient.available}</span>
                        <span class="separator">/</span>
                        <span class="required">${ingredient.required}</span>
                    </span>
                    ${!isSufficient ? `<span class="missing-amount">Missing: ${missingAmount}</span>` : ''}
                </div>
                <div class="ingredient-status">
                    <span class="status-icon">${statusIcon}</span>
                </div>
            </div>
        `;
    });
    ingredientsHTML += '</div>';
    
    // Craft status - check XP requirement
    let statusClass = recipe.available ? 'can-craft' : 'cannot-craft';
    let statusMessage = '';
    
    // Get current player XP
    const playerXP = parseInt(document.getElementById('player-xp-value')?.textContent || 0);
    
    if (recipe.available) {
        statusMessage = '✓ You can craft this item';
    } else if (playerXP < recipe.proficiency) {
        statusMessage = `✗ Insufficient XP (Need ${recipe.proficiency}, Have ${playerXP})`;
        statusClass = 'cannot-craft';
    } else {
        statusMessage = '✗ Insufficient resources';
    }
    
    card.innerHTML = `
        <div class="recipe-header">
            <img src="${recipe.icon}" alt="${recipe.displayName}" onerror="this.src='https://via.placeholder.com/64'">
            <h3>${recipe.displayName}</h3>
            ${recipe.bonusActive ? '<span class="bonus-badge">BONUS</span>' : ''}
        </div>
        
        <div class="recipe-info">
            <div class="recipe-xp-info">
                <span class="xp-required">Required XP: <strong>${recipe.proficiency || 0}</strong></span>
                <span class="xp-gain">Gain: <strong>+${recipe.xpGain || 0} XP</strong></span>
            </div>
        </div>
        
        <div class="quantity-section">
            <label for="quantity-${recipe.name}">Quantity to Craft:</label>
            <div class="quantity-controls">
                <button class="qty-btn qty-decrease" onclick="adjustQuantity('${recipe.name}', -1)">-</button>
                <input 
                    type="number" 
                    id="quantity-${recipe.name}" 
                    class="quantity-input" 
                    value="1" 
                    min="1" 
                    max="999"
                    onchange="updateRecipeQuantity('${recipe.name}', this.value)"
                >
                <button class="qty-btn qty-increase" onclick="adjustQuantity('${recipe.name}', 1)">+</button>
            </div>
            <div class="quantity-presets">
                <button class="preset-btn" onclick="setQuantity('${recipe.name}', 1)">1</button>
                <button class="preset-btn" onclick="setQuantity('${recipe.name}', 5)">5</button>
                <button class="preset-btn" onclick="setQuantity('${recipe.name}', 10)">10</button>
                <button class="preset-btn" data-amount="max" onclick="setMaxQuantity('${recipe.name}')">Max</button>
            </div>
        </div>
        
        <div id="ingredients-${recipe.name}">
            ${ingredientsHTML}
        </div>
        
        <div class="craft-status ${statusClass}" id="status-${recipe.name}">
            <span class="status-message">${statusMessage}</span>
        </div>
        
        <div class="recipe-footer">
            <div class="recipe-output">
                <span>Will Craft: <strong id="output-${recipe.name}">${recipe.amount}</strong> ${recipe.displayName}(s)</span>
            </div>
            <button class="craft-btn ${recipe.available ? 'enabled' : 'disabled'}" id="craft-btn-${recipe.name}" onclick="craftItem('${recipe.name}')" ${!recipe.available ? 'disabled' : ''}>
                ${recipe.available ? 'Craft' : 'Insufficient Resources'}
            </button>
        </div>
    `;
    
    return card;
}

// Adjust quantity
function adjustQuantity(recipeId, delta) {
    const input = document.getElementById(`quantity-${recipeId}`);
    if (!input) return;
    
    let currentValue = parseInt(input.value) || 1;
    let newValue = currentValue + delta;
    newValue = Math.max(1, Math.min(999, newValue));
    
    input.value = newValue;
    updateRecipeQuantity(recipeId, newValue);
}

// Set quantity
function setQuantity(recipeId, amount) {
    const input = document.getElementById(`quantity-${recipeId}`);
    if (!input) return;
    
    input.value = amount;
    updateRecipeQuantity(recipeId, amount);
}

// Set max quantity
function setMaxQuantity(recipeId) {
    const maxPossible = calculateMaxCraftable(recipeId);
    const input = document.getElementById(`quantity-${recipeId}`);
    if (!input) return;
    
    input.value = maxPossible;
    updateRecipeQuantity(recipeId, maxPossible);
}

// Calculate maximum craftable amount
function calculateMaxCraftable(recipeId) {
    const recipe = recipeDatabase[recipeId];
    if (!recipe) return 1;
    
    let maxCraftable = 999;
    
    recipe.baseIngredients.forEach(ingredient => {
        const requiredPerCraft = ingredient.required;
        const available = ingredient.available;
        const possibleCrafts = Math.floor(available / requiredPerCraft);
        maxCraftable = Math.min(maxCraftable, possibleCrafts);
    });
    
    return Math.max(1, maxCraftable);
}

// Update recipe display based on quantity
function updateRecipeQuantity(recipeId, quantity) {
    quantity = parseInt(quantity) || 1;
    quantity = Math.max(1, Math.min(999, quantity));
    
    const recipe = recipeDatabase[recipeId];
    if (!recipe) return;
    
    recipe.currentQuantity = quantity;
    
    // Calculate new ingredient requirements
    const updatedIngredients = recipe.baseIngredients.map(ingredient => ({
        ...ingredient,
        required: ingredient.required * quantity,
        sufficient: ingredient.available >= (ingredient.required * quantity)
    }));
    
    // Update ingredients display
    updateIngredientsDisplay(recipeId, updatedIngredients);
    
    // Update craft status
    updateCraftStatus(recipeId, updatedIngredients, quantity);
    
    // Update output display
    updateOutputDisplay(recipeId, quantity, recipe.amount);
    
    // Update craft button state
    updateCraftButton(recipeId, updatedIngredients);
}

// Update ingredients display
function updateIngredientsDisplay(recipeId, ingredients) {
    const ingredientsContainer = document.getElementById(`ingredients-${recipeId}`);
    if (!ingredientsContainer) return;
    
    let html = '';
    ingredients.forEach(ingredient => {
        const isSufficient = ingredient.sufficient;
        const statusIcon = isSufficient ? '✓' : '⚠️';
        const missingAmount = isSufficient ? 0 : ingredient.required - ingredient.available;
        
        html += `
            <div class="ingredient-item updating" data-sufficient="${isSufficient}">
                <img src="${ingredient.icon}" class="ingredient-icon" alt="${ingredient.name}" onerror="this.src='https://via.placeholder.com/36'">
                <div class="ingredient-info">
                    <span class="ingredient-name">${ingredient.name}</span>
                    <span class="ingredient-count ${isSufficient ? '' : 'insufficient'}">
                        <span class="available">${ingredient.available}</span>
                        <span class="separator">/</span>
                        <span class="required">${ingredient.required}</span>
                    </span>
                    ${!isSufficient ? `<span class="missing-amount">Missing: ${missingAmount}</span>` : ''}
                </div>
                <div class="ingredient-status">
                    <span class="status-icon">${statusIcon}</span>
                </div>
            </div>
        `;
    });
    
    ingredientsContainer.innerHTML = html;
}

// Update craft status message
function updateCraftStatus(recipeId, ingredients, quantity) {
    const statusContainer = document.getElementById(`status-${recipeId}`);
    if (!statusContainer) return;
    
    const recipe = recipeDatabase[recipeId];
    if (!recipe) return;
    
    const allSufficient = ingredients.every(ing => ing.sufficient);
    
    // Get current player XP
    const playerXP = parseInt(document.getElementById('player-xp-value')?.textContent || 0);
    
    let statusClass, statusMessage;
    
    // Check XP requirement first
    if (playerXP < recipe.proficiency) {
        statusClass = 'cannot-craft';
        statusMessage = `✗ Insufficient XP (Need ${recipe.proficiency}, Have ${playerXP})`;
    } else if (allSufficient) {
        statusClass = 'can-craft';
        statusMessage = `✓ You can craft ${quantity} item(s)`;
    } else {
        const maxPossible = calculateMaxCraftable(recipeId);
        
        if (maxPossible > 0) {
            statusClass = 'partial-craft';
            statusMessage = `⚠️ You can only craft ${maxPossible} item(s). Missing resources for ${quantity}.`;
        } else {
            const insufficientItems = ingredients.filter(ing => !ing.sufficient);
            statusClass = 'cannot-craft';
            statusMessage = `✗ Cannot craft. Missing: ${insufficientItems.map(i => i.name).join(', ')}`;
        }
    }
    
    statusContainer.className = `craft-status ${statusClass}`;
    statusContainer.querySelector('.status-message').textContent = statusMessage;
}

// Update output display
function updateOutputDisplay(recipeId, quantity, yieldPerCraft) {
    const outputElement = document.getElementById(`output-${recipeId}`);
    if (!outputElement) return;
    
    const totalOutput = quantity * yieldPerCraft;
    outputElement.textContent = totalOutput;
}

// Update craft button state
function updateCraftButton(recipeId, ingredients) {
    const craftBtn = document.getElementById(`craft-btn-${recipeId}`);
    if (!craftBtn) return;
    
    const recipe = recipeDatabase[recipeId];
    if (!recipe) return;
    
    // Get current player XP
    const playerXP = parseInt(document.getElementById('player-xp-value')?.textContent || 0);
    
    const hasResources = ingredients.every(ing => ing.sufficient);
    const hasXP = playerXP >= recipe.proficiency;
    const canCraft = hasResources && hasXP;
    
    craftBtn.disabled = !canCraft;
    
    if (!hasXP) {
        craftBtn.textContent = 'Insufficient XP';
    } else if (!hasResources) {
        craftBtn.textContent = 'Insufficient Resources';
    } else {
        craftBtn.textContent = 'Craft';
    }
    
    craftBtn.className = `craft-btn ${canCraft ? 'enabled' : 'disabled'}`;
}

// Craft item
function craftItem(recipeId) {
    const recipe = recipeDatabase[recipeId];
    if (!recipe) return;
    
    const quantity = recipe.currentQuantity;
    
    // Send craft request to Lua
    fetch(`https://${GetParentResourceName()}/craftItem`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            recipe: recipe,
            quantity: quantity
        })
    });
}

// Close crafting menu
function closeCrafting() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

// ESC key handler
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        closeCrafting();
    }
});