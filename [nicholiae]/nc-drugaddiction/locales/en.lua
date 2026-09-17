-- NC Drug Addiction System
-- English locale strings

Locales = Locales or {}
Locales['en'] = {
    -- General
    ['system_name'] = 'Drug Addiction System',
    ['enabled'] = 'Enabled',
    ['disabled'] = 'Disabled',
    
    -- Drug names
    ['drug_alcohol'] = 'Alcohol',
    ['drug_weed'] = 'Marijuana',
    ['drug_cocaine'] = 'Cocaine',
    ['drug_crack'] = 'Crack Cocaine',
    ['drug_meth'] = 'Methamphetamine',
    ['drug_ecstasy'] = 'Ecstasy',
    ['drug_fentanyl'] = 'Fentanyl',
    ['drug_lean'] = 'Lean',
    ['drug_oxycontin'] = 'Oxycontin',
    
    -- Addiction messages
    ['addiction_gain'] = 'Your %s addiction has increased.',
    ['addiction_level'] = 'Your %s addiction level: %d%%',
    ['addiction_threshold'] = 'You are becoming addicted to %s.',
    ['addiction_severe'] = 'WARNING: Your %s addiction is severe!',
    
    -- Withdrawal messages
    ['withdrawal_stage1'] = 'You feel a slight craving for %s.',
    ['withdrawal_stage2'] = 'You need %s. The craving is getting stronger.',
    ['withdrawal_stage3'] = 'You desperately need %s. The withdrawal is intense.',
    ['withdrawal_stage4'] = 'You can barely function without %s. This is agony.',
    ['withdrawal_blackout'] = 'You blacked out from withdrawal...',
    ['withdrawal_cleared'] = 'The withdrawal symptoms have subsided...',
    
    -- Overdose messages
    ['overdose_warning'] = 'WARNING: You have used too much %s!',
    ['overdose_critical'] = 'CRITICAL: You are overdosing on %s!',
    ['overdose_death'] = 'You have overdosed on %s.',
    ['overdose_ems_alert'] = 'OD Alert: %s has overdosed on %s at %s.',
    
    -- Treatment messages
    ['narcan_used'] = 'Narcan administered. All addictions reset.',
    ['narcan_effect'] = 'The Narcan is taking effect...',
    ['rehab_success'] = 'Rehab treatment complete. Your addictions have been reduced.',
    ['rehab_failed_money'] = 'You cannot afford rehab treatment ($%d).',
    ['rehab_not_needed'] = 'You do not currently need rehab treatment.',
    
    -- Health cap messages
    ['health_cap_reduced'] = 'Your maximum health has been reduced due to addiction.',
    ['health_cap_restored'] = 'Your maximum health has been restored.',
    ['health_cap_minimum'] = 'Your health is severely affected by addiction.',
    
    -- Tolerance messages
    ['tolerance_increased'] = 'Your body is building tolerance to %s.',
    ['tolerance_high'] = 'Your tolerance to %s is very high.',
    
    -- UI labels
    ['ui_addiction_level'] = 'Addiction Level',
    ['ui_tolerance_level'] = 'Tolerance',
    ['ui_health_cap'] = 'Max Health',
    ['ui_withdrawal_stage'] = 'Withdrawal',
    ['ui_last_used'] = 'Last Used',
    
    -- Drug categories
    ['category_stimulant'] = 'Stimulant',
    ['category_depressant'] = 'Depressant',
    ['category_hallucinogen'] = 'Hallucinogen',
    ['category_opioid'] = 'Opioid',
    
    -- Severity levels
    ['severity_none'] = 'None',
    ['severity_mild'] = 'Mild',
    ['severity_moderate'] = 'Moderate',
    ['severity_severe'] = 'Severe',
    
    -- Error messages
    ['error_unknown_drug'] = 'Unknown drug type.',
    ['error_player_not_found'] = 'Player not found.',
    ['error_no_addiction'] = 'No addiction data found.',
    ['error_system_disabled'] = 'Drug addiction system is currently disabled.',
    
    -- Debug messages
    ['debug_player_loaded'] = 'Loaded addiction data for player: %s',
    ['debug_player_saved'] = 'Saved addiction data for player: %s',
    ['debug_drug_used'] = '%s used %s - Addiction: %d',
    ['debug_decay_applied'] = 'Decay applied for %s: -%.2f',
    ['debug_health_cap_calculated'] = 'Health cap calculated: %d',
    
    -- Commands
    ['cmd_check_addiction'] = 'Check your current addiction levels',
    ['cmd_check_addiction_help'] = 'Displays all your current drug addiction levels',
    ['cmd_admin_reset_addiction'] = 'Reset a player\'s addictions',
    ['cmd_admin_reset_addiction_help'] = 'Resets all addictions for the specified player',
    ['cmd_admin_set_addiction'] = 'Set a player\'s addiction level',
    ['cmd_admin_set_addiction_help'] = 'Sets the addiction level for a specific drug for a player',
    
    -- Command feedback
    ['cmd_addiction_none'] = 'You have no current addictions.',
    ['cmd_addiction_list'] = 'Your addictions:',
    ['cmd_admin_reset_success'] = 'Successfully reset all addictions for %s.',
    ['cmd_admin_set_success'] = 'Set %s addiction to %d for %s.',
    ['cmd_admin_player_not_found'] = 'Player not found.',
    ['cmd_no_permission'] = 'You do not have permission to use this command.'
}