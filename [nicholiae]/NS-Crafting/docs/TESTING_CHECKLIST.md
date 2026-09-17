# Testing Checklist for NS-Crafting Enhanced

## 🧪 Pre-Deployment Testing Guide

Use this checklist to ensure all features work correctly before deploying to your live server.

---

## ✅ Basic Functionality Tests

### 1. Menu Opening/Closing
- [ ] Menu opens when triggered
- [ ] Menu displays correctly
- [ ] ESC key closes menu
- [ ] Close button works
- [ ] Menu reopens after closing

### 2. Recipe Display
- [ ] All recipes load correctly
- [ ] Recipe cards show proper information
- [ ] Icons display (or placeholder if missing)
- [ ] Ingredient lists are complete
- [ ] XP requirements show correctly

---

## ✅ Filter System Tests

### 3. Available Filter Toggle
- [ ] Toggle button exists and is visible
- [ ] Clicking changes icon from ☐ to ☑
- [ ] When active, only craftable recipes show
- [ ] When inactive, all recipes show
- [ ] Works independently from other filters
- [ ] Visual feedback (green highlight) works

### 4. Bench Filters
- [ ] All bench types display as filter buttons
- [ ] Clicking a bench filters recipes correctly
- [ ] Active bench shows visual highlight
- [ ] Clicking "All Recipes" resets filter
- [ ] Recipe counts update correctly
- [ ] Can switch between bench filters

### 5. Combined Filters
- [ ] Available + Bench filter works together
- [ ] Available + Search works together
- [ ] Bench + Search works together
- [ ] All three filters work together
- [ ] Filters reset properly

### 6. Search Functionality
- [ ] Search bar accepts input
- [ ] Typing filters recipes in real-time
- [ ] Case-insensitive search works
- [ ] Partial matches work
- [ ] Clearing search shows all recipes

---

## ✅ Visual Inventory Comparison Tests

### 7. Ingredient Display
- [ ] All ingredients show with icons
- [ ] Available/Required counts display correctly
- [ ] Green border for sufficient ingredients
- [ ] Red border for insufficient ingredients
- [ ] Status icons (✓/⚠️) appear correctly

### 8. Missing Amount Indicators
- [ ] "Missing: X" appears for insufficient items
- [ ] Missing amount is accurate
- [ ] Blink animation works
- [ ] Color coding is correct

### 9. Recipe Card Status
- [ ] Green top border for craftable recipes
- [ ] Red top border for non-craftable recipes
- [ ] Overall card opacity changes appropriately

---

## ✅ Reactive Quantity System Tests

### 10. Quantity Controls
- [ ] + button increases quantity
- [ ] - button decreases quantity
- [ ] Number input accepts direct typing
- [ ] Quantity clamps between 1-999
- [ ] Preset buttons (1, 5, 10) work
- [ ] Max button calculates correctly

### 11. Real-Time Updates
- [ ] Ingredients multiply correctly (1→30 = 2→60)
- [ ] Available vs Required updates instantly
- [ ] Missing amounts recalculate
- [ ] Status message updates
- [ ] Output amount updates
- [ ] Craft button enables/disables

### 12. Max Button Logic
- [ ] Calculates based on limiting ingredient
- [ ] Sets correct maximum quantity
- [ ] Works with multiple ingredients
- [ ] Handles zero inventory correctly
- [ ] Updates all displays after setting

### 13. Status Messages
- [ ] "✓ You can craft X items" for sufficient
- [ ] "⚠️ You can only craft X items" for partial
- [ ] "✗ Cannot craft. Missing: items" for insufficient
- [ ] Messages update with quantity changes
- [ ] Color coding matches status

### 14. Craft Button States
- [ ] Green and enabled when craftable
- [ ] Red and disabled when not craftable
- [ ] Text changes appropriately
- [ ] Hover effects work when enabled
- [ ] No hover effects when disabled

---

## ✅ Access Control Tests

### 15. Universal Benches
- [ ] Unemployed bench accessible to all
- [ ] Joint bench accessible to all
- [ ] Blunt bench accessible to all
- [ ] No access denied messages

### 16. Job-Based Benches
- [ ] Lux bench only for lux job
- [ ] Police bench only for police job
- [ ] Mechanic bench only for mechanic job
- [ ] Access denied message for wrong job
- [ ] Menu doesn't open without access

### 17. Gang-Based Benches
- [ ] Ballas bench only for ballas gang
- [ ] Syndicate bench only for syndicate gang
- [ ] Gang bench for any gang member
- [ ] Access denied for non-gang members
- [ ] Menu doesn't open without access

### 18. Access Control Edge Cases
- [ ] Unemployed player can access universal benches
- [ ] Player with no gang can't access gang benches
- [ ] Job change updates access correctly
- [ ] Gang change updates access correctly

---

## ✅ Bonus Zone Tests

### 19. Zone Detection
- [ ] Entering zone triggers alien effects
- [ ] Zone detection updates every 500ms
- [ ] All three zones detect correctly
- [ ] Leaving zone stops effects
- [ ] Debug mode shows zone status (if enabled)

### 20. Bonus Indicators
- [ ] "⚡ BONUS ZONE ACTIVE" shows in header
- [ ] Bonus badge appears on eligible recipes
- [ ] Notification mentions bonus zone
- [ ] Indicator hides outside zones

### 21. Yield Bonuses
- [ ] Non-weapon items get 2x yield
- [ ] Weapons don't get yield bonus
- [ ] Blacklisted items don't get yield bonus
- [ ] Bonus applies to final output
- [ ] Recipe card shows bonus amount

### 22. Time Bonuses
- [ ] Crafting time reduces by 50%
- [ ] Time bonus applies to all items
- [ ] Time bonus works with yield bonus
- [ ] Recipe card shows bonus time

### 23. Bonus Zone Edge Cases
- [ ] Crafting outside zone gives normal yield
- [ ] Moving between zones works correctly
- [ ] Bonus applies at craft time, not menu open
- [ ] Multiple items crafted get bonus each

---

## ✅ Crafting Process Tests

### 24. Single Item Crafting
- [ ] Crafting 1 item works
- [ ] Correct items removed from inventory
- [ ] Correct items added to inventory
- [ ] XP gained correctly
- [ ] Menu refreshes after craft

### 25. Multiple Item Crafting
- [ ] Crafting 10 items works
- [ ] Correct quantities removed (10x requirements)
- [ ] Correct quantities added (10x yield)
- [ ] XP scales correctly
- [ ] Menu refreshes after craft

### 26. Max Quantity Crafting
- [ ] Max button sets correct amount
- [ ] Crafting max amount works
- [ ] All ingredients consumed correctly
- [ ] Correct output received
- [ ] No items left over incorrectly

### 27. Bonus Zone Crafting
- [ ] Bonus yield applies correctly
- [ ] Bonus time applies correctly
- [ ] Both bonuses work together
- [ ] Blacklist exclusions work
- [ ] Weapon exclusions work

---

## ✅ UI/UX Tests

### 28. Animations
- [ ] Pulse animation on bonus indicator
- [ ] Update animation on quantity change
- [ ] Shake animation on insufficient
- [ ] Blink animation on missing amounts
- [ ] Hover effects on all buttons

### 29. Responsive Design
- [ ] Layout works on different resolutions
- [ ] Scrolling works with many recipes
- [ ] Buttons are clickable
- [ ] Text is readable
- [ ] No overlapping elements

### 30. Visual Feedback
- [ ] Color changes are clear
- [ ] Icons are visible
- [ ] Status messages are readable
- [ ] Borders are distinct
- [ ] Badges stand out

---

## ✅ Performance Tests

### 31. Loading Performance
- [ ] Menu opens quickly (<1 second)
- [ ] Recipes load without lag
- [ ] Filters apply instantly
- [ ] Search is responsive
- [ ] No frame drops

### 32. Update Performance
- [ ] Quantity changes are instant
- [ ] Filter changes are smooth
- [ ] No lag with many recipes
- [ ] Animations are smooth
- [ ] No memory leaks

### 33. Zone Detection Performance
- [ ] Zone checks don't cause lag
- [ ] Effects don't impact FPS
- [ ] Multiple zones work smoothly
- [ ] No performance issues

---

## ✅ Error Handling Tests

### 34. Missing Data
- [ ] Missing icons show placeholder
- [ ] Missing ingredients handled gracefully
- [ ] Invalid quantities clamped correctly
- [ ] Empty recipe lists show message
- [ ] Missing config values use defaults

### 35. Edge Cases
- [ ] Zero inventory handled correctly
- [ ] Negative quantities prevented
- [ ] Very large quantities work
- [ ] Special characters in search work
- [ ] Rapid clicking doesn't break UI

---

## ✅ Integration Tests

### 36. QBCore Integration
- [ ] Player data loads correctly
- [ ] Inventory callback works
- [ ] Item metadata correct
- [ ] Job/gang data accurate
- [ ] XP system integrated

### 37. Server Communication
- [ ] Craft requests send correctly
- [ ] Server responses received
- [ ] Inventory updates sync
- [ ] XP updates sync
- [ ] No desync issues

---

## 📊 Test Results Summary

### Critical Issues (Must Fix)
- [ ] List any critical bugs here

### Minor Issues (Should Fix)
- [ ] List any minor bugs here

### Enhancements (Nice to Have)
- [ ] List any improvement ideas here

---

## ✅ Final Approval

- [ ] All critical tests passed
- [ ] All major features working
- [ ] No game-breaking bugs
- [ ] Performance acceptable
- [ ] Ready for production deployment

---

## 📝 Notes

Use this section to document any specific findings, workarounds, or configuration changes needed:

```
[Your notes here]
```

---

**Tested By:** _______________  
**Date:** _______________  
**Server:** _______________  
**Version:** 2.0 Enhanced Edition