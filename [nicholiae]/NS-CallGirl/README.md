# NS-CallGirl Enhanced - Custom Prostitute Models

## Overview
This enhanced version uses fully customizable freemode models (`mp_f_freemode_01`) allowing complete control over the prostitutes' appearance. Each prostitute has a unique look and transitions from lingerie to completely naked during the encounter.

## Features
- **4 Distinct Prostitutes**: Each with unique hair, personality, and aesthetic
- **Lingerie State**: Prostitutes start in themed lingerie matching their personality
- **Naked Transition**: Automatically become completely naked during Phase 2
- **Full Customization**: All appearance aspects can be modified (hair, makeup, clothing)
- **Reputation System**: Build relationships with tier-based benefits
- **Database Persistence**: All relationships stored in MySQL

## The Prostitutes

### 1. Juliet - "The Beach Girl" 🌊
- **Personality**: Flirty, carefree, fun-loving
- **Aesthetic**: Beach babe with blonde waves
- **Lingerie**: White bikini set, barefoot
- **Naked**: Completely nude, barefoot

### 2. Candy - "The Hills Princess" 💖
- **Personality**: Demanding, high-maintenance, glamorous
- **Aesthetic**: Instagram model with pink hair
- **Lingerie**: Pink satin bra and panties, pink heels
- **Naked**: Completely nude, keeps pink heels on

### 3. Diamond - "The Socialite" 🖤
- **Personality**: Sophisticated, elegant, refined
- **Aesthetic**: High-class escort with elegant updo
- **Lingerie**: Black lace bra and panties, black stilettos
- **Naked**: Completely nude, keeps black heels on

### 4. Sapphire - "The Business Woman" 💙
- **Personality**: Professional, no-nonsense, confident
- **Aesthetic**: Modern professional with short bob
- **Lingerie**: Blue satin bra and panties, blue heels
- **Naked**: Completely nude, keeps blue heels on

## Clothing Transition Timeline

1. **Phase 1 (Blowjob)**: Prostitute in lingerie
2. **Phase 2 (Doggy Style)**: Prostitute becomes completely naked
3. **Phase 3 (Cowgirl)**: Prostitute stays naked

## Technical Details

### Model Configuration
All prostitutes use `mp_f_freemode_01` with custom clothing components:

**Lingerie State:**
- Component 11 (Torso2): 3 = Bra (different textures for colors)
- Component 4 (Pants): 15 = Panties (different textures for colors)
- Component 6 (Shoes): 8 = High heels or 35 = Barefoot

**Naked State:**
- Component 11 (Torso2): 15 = Topless
- Component 4 (Pants): 15 = Bottomless
- Component 8 (Undershirt): 15 = No undershirt
- Component 3 (Arms): 15 = Bare arms

### Customization
You can easily customize each prostitute's appearance by editing the `Config.Prostitutes` table in `config.lua`:

```lua
features = {
    hair = 4,           -- Hair style number
    hair_color = 4,     -- Hair color number
    hair_highlight = 4, -- Hair highlight color
},

lingerie = {
    torso2 = { drawable = 3, texture = 0 },  -- Bra
    pants = { drawable = 15, texture = 0 },  -- Panties
    shoes = { drawable = 35, texture = 0 },  -- Shoes
    -- ... other components
},

naked = {
    torso2 = { drawable = 15, texture = 0 }, -- Topless
    pants = { drawable = 15, texture = 0 },  -- Bottomless
    -- ... other components
}
```

## Installation

1. Ensure you have the required dependencies:
   - qb-core
   - oxmysql
   - qb-clothing
   - qb-banking

2. Import the database schema:
   ```sql
   CREATE TABLE IF NOT EXISTS `pimp_relationships` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `citizenid` varchar(50) NOT NULL,
     `prostitute_model` int(11) NOT NULL,
     `prostitute_name` varchar(50) NOT NULL,
     `reputation` int(11) DEFAULT 0,
     `tier` int(11) DEFAULT 1,
     `relationship_status` varchar(50) DEFAULT 'Stranger',
     `bonus_multiplier` decimal(3,2) DEFAULT 0.00,
     `total_interactions` int(11) DEFAULT 0,
     `successful_interactions` int(11) DEFAULT 0,
     `last_interaction` timestamp DEFAULT CURRENT_TIMESTAMP,
     `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
     `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     PRIMARY KEY (`id`),
     UNIQUE KEY `citizenid_prostitute_model` (`citizenid`, `prostitute_model`)
   );
   ```

3. Add the resource to your server.cfg:
   ```
   ensure NS-CallGirl
   ```

4. Restart your server

## Configuration

All settings can be adjusted in `config.lua`:
- Location coordinates
- Phase timing
- Base pricing
- Prostitute appearances
- Reputation tiers
- Debug mode

## Reputation System

### Tiers
1. **Stranger** (0-20 rep): No discount
2. **Acquaintance** (21-40 rep): 10% discount
3. **Friend** (41-60 rep): 20% discount
4. **Partner** (61-80 rep): 35% discount
5. **Exclusive** (81-100 rep): Free services

### Reputation Gains
- Phase 1 completion: +1.0 reputation
- Phase 2 completion: +1.5 reputation
- Phase 3 completion: +2.0 reputation
- **Total per session: +4.5 reputation**

## Preview
Open `prostitute_preview.html` in a web browser to see a visual preview of all 4 prostitute designs with their lingerie and naked states.

## Credits
- Original NS-CallGirl module by Nicholiae
- PickUpAHoe module by Nicholiae
- Enhanced version with custom models by NinjaTech AI

## Support
For issues or questions, please refer to the documentation files included in the package.