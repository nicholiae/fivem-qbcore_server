local QBCore = exports['qb-core']:GetCoreObject()
-- Flying hook https://discord.com/api/webhooks/1293717009485402174/Ac1ZsE674gkFAmXtZjfpscAVrdxt69ddWjwTYXUJe5qkllIVMgK_FZIM8Wp6ZiJ6wv9f
-- playa hook https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv
-- Job hook https://discord.com/api/webhooks/1262554638654242917/DPId7rSRkf2shmmvxMKLLl2IZ8sZkqmvh-QqRqzL2eHYuIetyYra9U2ozkuhknIqrE3I
-- scriptJobs hook https://discord.com/api/webhooks/1360637993978822867/T5ZklMYA_bzDl_u8_BGtqpynPU4xJiY0078p0VP4OmRN24bpygASas7GvuKRtuipGwD7
-- admin hook https://discord.com/api/webhooks/1262554437822709780/E_rhIlmP0CZdbBbG1WpdGndVKv9Fb2RfKlOpnn_Sx5XG8jxNtt0fgDanzlfCuWYv5qTH
-- mission hook https://discord.com/api/webhooks/1262554540419448892/lG36hLTKLEN6sqgbAQG11PralKITapyw5-egUHRiH2FiOwWy0p1Q-VL4cMdO-beTkIvp
-- money hook https://discord.com/api/webhooks/1262554312345911417/pGkOVPr9mXlgFa_4P1XOuZkZlkOWPpeQvrm89UnGxhSPvelevPCoaykPPl35RUvXigKt
-- playermoneyexcess hook https://discord.com/api/webhooks/1358889701263806675/AeKnRSjsFzE_uZMjbIK9HPl9IivHq84kgctG2wxTzt7TBEjRtBQxi4_dU68uP6qvIG6N
-- paycheck hook https://discord.com/api/webhooks/1340836951711809548/ujoFOYVf7VVDSxIPmOVNkPvAeLnaohoSnQ3dFKb0qHwRTT_hJlhc-n72CeF3fLWB_JDD
-- death hook https://discord.com/api/webhooks/1331816867131559946/zqCdrIBDwgvtERnSKRz_K3Xc21YMDoVENq4fbLPg-77Pcxx0dD47wR_LvkFVaNqfsOm0
-- chat hook https://discord.com/api/webhooks/1331817036816318555/gT2sFOgnodFiuf6F3A7VGQFGjNcQn2dHtBddEkil8h2MSgkes87LCRxEhoahwlJA5IcO
-- heist hook https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1
-- arrest hook https://discord.com/api/webhooks/1331817831213437019/pz8o0_SpbkFxN0lwp2C1-v0pW2GlNsKBayapeHzt45C3M12ssYrDzcyY5lCfUgjD7Bdo
-- vehicle hook https://discord.com/api/webhooks/1331818162827563090/Ie8T_ljnhUAt0iYEZD5CjxRNn7yKoqTdkij_MZpfOgsZVkOZ5jcnI6A-fi7uUxGiYTan
-- player inv hook https://discord.com/api/webhooks/1331818671684980816/3Ta0s0ZpSMSfRiHvGDCcrvonRIXNX9FlGcDJ_jSf420k2EHhDdZLT3ReaBXjGhVRsSVk
-- set inv hook https://discord.com/api/webhooks/1333874463187537991/cNL7P_GRzfHcMScO2HzKEvIovolLMGnhPlbN88626qSQ-Vg4nF-fRbLnpjgvHgHS-6uR
-- openinventory hook https://discord.com/api/webhooks/1333877519509880955/sctKan_iOpFUWaUW8JKv5-IfnNg2L5o5BHIK0KXuH-0lneBBcEJyRGodZM9_nwjHFmnG
-- saveinventory hook https://discord.com/api/webhooks/1333954743147565057/xIHzUYQF6f5jZkeeUC9TC8ZvvPaIVR2PFcBvDDhHAwUqG54bh4TZ3FKaMxb5SWrGiaBG
-- clearinventory hook https://discord.com/api/webhooks/1333874754230292540/2BVghWViEfhzsW3tuIWCnNmvRTlqgoWnTEgPSTu48hiiwUZrX3IA0g1LbTYeOSTtyfAX
-- realestate hook https://discord.com/api/webhooks/1332832914592759808/Kz-inv1QlSVW9pL3kudPsrbWr21lPcNTbaQyuyMo4n4GdAW6InNkS2DPVc8jZ6-UybsB
-- crypto hook https://discord.com/api/webhooks/1335246677614792775/3T8V1envTu24l3pLGjgnhFyU1-idFLF4vTlakE0Sgw8Rzt1ONmARiUEvFCCy3FDiAGoJ
-- cryptocrash hook https://discord.com/api/webhooks/1367638473896493076/DUL9HpOG4VrOhV-FCBM1WoJzv79O5JnV51-SI1zcNdG9iFTNMvDIMwjV0zh7ml7Z5Qzu
-- anticheat hook https://discord.com/api/webhooks/1335642878210216087/NmaJMMdp8aE8rVvmdcrol5HJXBvdKqCRuZeQQYXzsb7Lby8ghx3ynKqkj2EW24dcynS9
-- repossession hook https://discord.com/api/webhooks/1353375375811678314/auDZuyzaFmHldH1IRJbYC8TgMYnDcukUJ-4cQOyvygyyIZ836LJl2kNyQSAqKFXhpAe1
-- repossessionSim hook https://discord.com/api/webhooks/1356695859244564481/W4NoFIlk4zSNtsYMh5edVDHdDAqt0H_x9pC4l0I7UQlc3etsd5Om6yTDC7dccxlOicvz
-- taxes hook https://discord.com/api/webhooks/1340320985420791869/gqh1rI5J0XYikfTl4DSl9wuMz94e2KKBE3BbqY-yMI5_GcEHFhAvrhaMy5U1lZZ50fYh
-- doc hook https://discord.com/api/webhooks/1340900167439614102/nVcSZIJv_LxMA1UVNWAXeRDmQDbHvyHBdyv2RZtE2fb37ctl054pHh7bG9dgJtyu-vUo
-- militarywatch hook https://discord.com/api/webhooks/1341043455752802465/XUuZeK7zEWkL5NEOMxspL8-3OUBeSwiTu_6SkGgU1CDTnsgf_KNFIm5w3hm2_xWX5U0n
-- logem hook https://discord.com/api/webhooks/1342673268498370671/fr7bJ3SEQzGpqg38lrWBIl5fjV73YmG5Op8Jgrn8kWqjNeVVjdSfUvr-0kplJPlce0nu
-- lootCrates hook https://discord.com/api/webhooks/1345910919699501099/bf3MyD7jm8I5OKorCWTxDd2-8kbP7nSrFg2AbccyTiZ0XDLc2sXLpF9QcNstah6YC7HX
-- lootcheats hook https://discord.com/api/webhooks/1347215339687252008/4bBDi8BrDnhlfJbIWW4na_84JC7ng-ZZMDe7jnHPv1vWO8v3aTxHisiAUdV4H4WfM1I9
-- territories hook https://discord.com/api/webhooks/1347373984894681098/yxaaV4IyXWCE8HQRGDvoEX_Zx_GY85LJLMdRgK1b5JcO-quwhmqX4s9gZfgHo0kQkL9T
-- BattleRoyal hook https://discord.com/api/webhooks/1347692319222005820/sq4-dpjHXoSUuTJE17lxzMrao7dNosTqh_H6d5iaW4kuKGEARSNuJ0E44BhaogMFJN9G
local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1262554437822709780/E_rhIlmP0CZdbBbG1WpdGndVKv9Fb2RfKlOpnn_Sx5XG8jxNtt0fgDanzlfCuWYv5qTH',
    ['BattleRoyal'] = 'https://discord.com/api/webhooks/1347692319222005820/sq4-dpjHXoSUuTJE17lxzMrao7dNosTqh_H6d5iaW4kuKGEARSNuJ0E44BhaogMFJN9G',
    ['territories'] = 'https://discord.com/api/webhooks/1347373984894681098/yxaaV4IyXWCE8HQRGDvoEX_Zx_GY85LJLMdRgK1b5JcO-quwhmqX4s9gZfgHo0kQkL9T',
    ['lootCrates'] = 'https://discord.com/api/webhooks/1345910919699501099/bf3MyD7jm8I5OKorCWTxDd2-8kbP7nSrFg2AbccyTiZ0XDLc2sXLpF9QcNstah6YC7HX',
    ['lootcheats'] = 'https://discord.com/api/webhooks/1347215339687252008/4bBDi8BrDnhlfJbIWW4na_84JC7ng-ZZMDe7jnHPv1vWO8v3aTxHisiAUdV4H4WfM1I9',
    ['logem'] = 'https://discord.com/api/webhooks/1342673268498370671/fr7bJ3SEQzGpqg38lrWBIl5fjV73YmG5Op8Jgrn8kWqjNeVVjdSfUvr-0kplJPlce0nu',
    ['militarywatch'] = 'https://discord.com/api/webhooks/1341043455752802465/XUuZeK7zEWkL5NEOMxspL8-3OUBeSwiTu_6SkGgU1CDTnsgf_KNFIm5w3hm2_xWX5U0n',
    ['repossession'] = 'https://discord.com/api/webhooks/1353375375811678314/auDZuyzaFmHldH1IRJbYC8TgMYnDcukUJ-4cQOyvygyyIZ836LJl2kNyQSAqKFXhpAe1',
    ['repossessionSim'] = 'https://discord.com/api/webhooks/1356695859244564481/W4NoFIlk4zSNtsYMh5edVDHdDAqt0H_x9pC4l0I7UQlc3etsd5Om6yTDC7dccxlOicvz',
    ['taxes'] = 'https://discord.com/api/webhooks/1340320985420791869/gqh1rI5J0XYikfTl4DSl9wuMz94e2KKBE3BbqY-yMI5_GcEHFhAvrhaMy5U1lZZ50fYh',
    ['crypto'] = 'https://discord.com/api/webhooks/1335246677614792775/3T8V1envTu24l3pLGjgnhFyU1-idFLF4vTlakE0Sgw8Rzt1ONmARiUEvFCCy3FDiAGoJ',
    ['cryptocrash'] = 'https://discord.com/api/webhooks/1367638473896493076/DUL9HpOG4VrOhV-FCBM1WoJzv79O5JnV51-SI1zcNdG9iFTNMvDIMwjV0zh7ml7Z5Qzu',
    ['docAI'] = 'https://discord.com/api/webhooks/1340900167439614102/nVcSZIJv_LxMA1UVNWAXeRDmQDbHvyHBdyv2RZtE2fb37ctl054pHh7bG9dgJtyu-vUo',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1262554437822709780/E_rhIlmP0CZdbBbG1WpdGndVKv9Fb2RfKlOpnn_Sx5XG8jxNtt0fgDanzlfCuWYv5qTH',
    ['playermoney'] = 'https://discord.com/api/webhooks/1262554312345911417/pGkOVPr9mXlgFa_4P1XOuZkZlkOWPpeQvrm89UnGxhSPvelevPCoaykPPl35RUvXigKt',
    ['playermoneyexcess'] = 'https://discord.com/api/webhooks/1358889701263806675/AeKnRSjsFzE_uZMjbIK9HPl9IivHq84kgctG2wxTzt7TBEjRtBQxi4_dU68uP6qvIG6N',
    ['paychecks'] = 'https://discord.com/api/webhooks/1340836951711809548/ujoFOYVf7VVDSxIPmOVNkPvAeLnaohoSnQ3dFKb0qHwRTT_hJlhc-n72CeF3fLWB_JDD',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1331818671684980816/3Ta0s0ZpSMSfRiHvGDCcrvonRIXNX9FlGcDJ_jSf420k2EHhDdZLT3ReaBXjGhVRsSVk',
    ['setinventory'] = 'https://discord.com/api/webhooks/1333874463187537991/cNL7P_GRzfHcMScO2HzKEvIovolLMGnhPlbN88626qSQ-Vg4nF-fRbLnpjgvHgHS-6uR',
    ['clearinventory'] = 'https://discord.com/api/webhooks/1333874754230292540/2BVghWViEfhzsW3tuIWCnNmvRTlqgoWnTEgPSTu48hiiwUZrX3IA0g1LbTYeOSTtyfAX',
    ['openinventory'] = 'https://discord.com/api/webhooks/1333877519509880955/sctKan_iOpFUWaUW8JKv5-IfnNg2L5o5BHIK0KXuH-0lneBBcEJyRGodZM9_nwjHFmnG',
    ['saveinventory'] = 'https://discord.com/api/webhooks/1333954743147565057/xIHzUYQF6f5jZkeeUC9TC8ZvvPaIVR2PFcBvDDhHAwUqG54bh4TZ3FKaMxb5SWrGiaBG',
    ['robbing'] = 'https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1',
    ['cuffing'] = 'https://discord.com/api/webhooks/1331817831213437019/pz8o0_SpbkFxN0lwp2C1-v0pW2GlNsKBayapeHzt45C3M12ssYrDzcyY5lCfUgjD7Bdo',
    ['drop'] = 'https://discord.com/api/webhooks/1331818671684980816/3Ta0s0ZpSMSfRiHvGDCcrvonRIXNX9FlGcDJ_jSf420k2EHhDdZLT3ReaBXjGhVRsSVk',
    ['trunk'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['stash'] = 'https://discord.com/api/webhooks/1331818671684980816/3Ta0s0ZpSMSfRiHvGDCcrvonRIXNX9FlGcDJ_jSf420k2EHhDdZLT3ReaBXjGhVRsSVk',
    ['glovebox'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['banking'] = 'https://discord.com/api/webhooks/1262554312345911417/pGkOVPr9mXlgFa_4P1XOuZkZlkOWPpeQvrm89UnGxhSPvelevPCoaykPPl35RUvXigKt',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1331818162827563090/Ie8T_ljnhUAt0iYEZD5CjxRNn7yKoqTdkij_MZpfOgsZVkOZ5jcnI6A-fi7uUxGiYTan',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1331818162827563090/Ie8T_ljnhUAt0iYEZD5CjxRNn7yKoqTdkij_MZpfOgsZVkOZ5jcnI6A-fi7uUxGiYTan',
    ['shops'] = 'https://discord.com/api/webhooks/1262554638654242917/DPId7rSRkf2shmmvxMKLLl2IZ8sZkqmvh-QqRqzL2eHYuIetyYra9U2ozkuhknIqrE3I',
    ['dealers'] = 'https://discord.com/api/webhooks/1262554638654242917/DPId7rSRkf2shmmvxMKLLl2IZ8sZkqmvh-QqRqzL2eHYuIetyYra9U2ozkuhknIqrE3I',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1',
    ['powerplants'] = 'https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1',
    ['death'] = 'https://discord.com/api/webhooks/1331816867131559946/zqCdrIBDwgvtERnSKRz_K3Xc21YMDoVENq4fbLPg-77Pcxx0dD47wR_LvkFVaNqfsOm0',
    ['joinleave'] = 'https://discord.com/api/webhooks/1293717009485402174/Ac1ZsE674gkFAmXtZjfpscAVrdxt69ddWjwTYXUJe5qkllIVMgK_FZIM8Wp6ZiJ6wv9f',
    ['ooc'] = 'https://discord.com/api/webhooks/1331817036816318555/gT2sFOgnodFiuf6F3A7VGQFGjNcQn2dHtBddEkil8h2MSgkes87LCRxEhoahwlJA5IcO',
    ['report'] = 'https://discord.com/api/webhooks/1331817036816318555/gT2sFOgnodFiuf6F3A7VGQFGjNcQn2dHtBddEkil8h2MSgkes87LCRxEhoahwlJA5IcO',
    ['me'] = 'https://discord.com/api/webhooks/1331817036816318555/gT2sFOgnodFiuf6F3A7VGQFGjNcQn2dHtBddEkil8h2MSgkes87LCRxEhoahwlJA5IcO',
    ['pmelding'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['112'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['bans'] = 'https://discord.com/api/webhooks/1335642878210216087/NmaJMMdp8aE8rVvmdcrol5HJXBvdKqCRuZeQQYXzsb7Lby8ghx3ynKqkj2EW24dcynS9',
    ['anticheat'] = 'https://discord.com/api/webhooks/1335642878210216087/NmaJMMdp8aE8rVvmdcrol5HJXBvdKqCRuZeQQYXzsb7Lby8ghx3ynKqkj2EW24dcynS9',
    ['weather'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1',
    ['bennys'] = 'https://discord.com/api/webhooks/1262554638654242917/DPId7rSRkf2shmmvxMKLLl2IZ8sZkqmvh-QqRqzL2eHYuIetyYra9U2ozkuhknIqrE3I',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1262554638654242917/DPId7rSRkf2shmmvxMKLLl2IZ8sZkqmvh-QqRqzL2eHYuIetyYra9U2ozkuhknIqrE3I',
    ['robbery'] = 'https://discord.com/api/webhooks/1331817500232515649/9_CvSQfJJF8V8ObPxvgN3nUGjZf-idSx7T-dZZaWRZMsQQKgfVsNwa80mH5cWJfvp-_1',
    ['casino'] = 'https://discord.com/api/webhooks/1262554312345911417/pGkOVPr9mXlgFa_4P1XOuZkZlkOWPpeQvrm89UnGxhSPvelevPCoaykPPl35RUvXigKt',
    ['traphouse'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['911'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['palert'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['house'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1262554638654242917/DPId7rSRkf2shmmvxMKLLl2IZ8sZkqmvh-QqRqzL2eHYuIetyYra9U2ozkuhknIqrE3I',
    ['fishing'] = 'https://discord.com/api/webhooks/1262554111627366471/fQDeMXU1-M7EE6qcw2vZX-jAXmw-GvtItpOV5W3iLvRuLb2h_-XYBldIP1YlEUnjZNDv',
    ['admin'] = 'https://discord.com/api/webhooks/1262554437822709780/E_rhIlmP0CZdbBbG1WpdGndVKv9Fb2RfKlOpnn_Sx5XG8jxNtt0fgDanzlfCuWYv5qTH',
    ['adminmenu'] = 'https://discord.com/api/webhooks/1262554437822709780/E_rhIlmP0CZdbBbG1WpdGndVKv9Fb2RfKlOpnn_Sx5XG8jxNtt0fgDanzlfCuWYv5qTH',
    ['scriptjobs'] = 'https://discord.com/api/webhooks/1360637993978822867/T5ZklMYA_bzDl_u8_BGtqpynPU4xJiY0078p0VP4OmRN24bpygASas7GvuKRtuipGwD7',
    ['realestate'] = 'https://discord.com/api/webhooks/1332832914592759808/Kz-inv1QlSVW9pL3kudPsrbWr21lPcNTbaQyuyMo4n4GdAW6InNkS2DPVc8jZ6-UybsB',
    ['nico'] = 'https://discord.com/api/webhooks/1434223408626798602/YW8AqtUerqEJMehp24mHcDofXJuygzrWXBLrp3v_3Ixk53a5s1lJADJ3z1M4yAICt1ew',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local postData = {}
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData, dataTag = tag }

        if #logQueue[name] >= 10 then
            if tag then
                -- postData = { username = 'QB Logs', content = '@235201266098241540', embeds = {} }
                postData = { username = 'QB Logs', content = '', embeds = {} }
            else				
                postData = { username = 'QB Logs', embeds = {} }
            end
            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

RegisterNetEvent('qb-log:server:CreateTaxLog', function(name, title, color, message, tagEveryone, imageUrl, playerName)
    local postData = {}
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData, dataTag = tag, dataTagName = playerName }

        if #logQueue[name] >= 10 then
            if tag then
				postData = { username = 'QB Logs', content = '', embeds = {} }
            else
                postData = { username = 'QB Logs', embeds = {} }
            end
            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
						if queue[i].dataTag == true then
							if queue[i].dataTagName then
								postData = { username = 'QB Logs', content = '@'..tostring(queue[i].dataTagName), embeds = {} }
							else
								postData = { username = 'QB Logs', content = '', embeds = {} }
							end
						end
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
