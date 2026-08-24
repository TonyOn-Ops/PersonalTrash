@echo off
title HP Analytics Blocker
color 0C

:loop

:: Termina processi HP Insights / Analytics
taskkill /F /IM HPInsightsAnalyticsService.exe >nul 2>&1
taskkill /F /IM HPInsights.exe >nul 2>&1
taskkill /F /IM HPAnalytics.exe >nul 2>&1
taskkill /F /IM HPTelemetryService.exe >nul 2>&1
taskkill /F /IM HPTechPulse.exe >nul 2>&1
taskkill /F /IM TAInstaller.exe >nul 2>&1
taskkill /F /IM TouchpointAnalyticsClientService.exe >nul 2>&1

:: Arresta servizi HP
sc stop "HPInsightsAnalyticsService" >nul 2>&1
sc stop "HP TechPulse Core" >nul 2>&1
sc stop "HP Insights" >nul 2>&1

:: Disabilita servizi
sc config "HPInsightsAnalyticsService" start= disabled >nul 2>&1
sc config "HP TechPulse Core" start= disabled >nul 2>&1
sc config "HP Insights" start= disabled >nul 2>&1

timeout /t 5 >nul

goto loop