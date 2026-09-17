// UI functionality for the crafting system

// Search functionality
document.addEventListener('DOMContentLoaded', function() {
    const recipeSearch = document.getElementById('recipe-search');
    
    if (recipeSearch) {
        recipeSearch.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const recipeCards = document.querySelectorAll('.recipe-card');
            
            recipeCards.forEach(card => {
                const recipeName = card.querySelector('.recipe-name').textContent.toLowerCase();
                if (recipeName.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }
});

// Close crafting menu on ESC key
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' || e.key === 'Esc') {
        e.preventDefault();
        fetch('https://ns-crafting/close', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            body: JSON.stringify({})
        }).catch(err => console.log('Close request sent'));
    }
});