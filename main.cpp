/****************************************************************************
**
** Copyright (C) 2017 Eric Lee.
** Contact: levanhong05@gmail.com
** Company: DFM-Engineering Vietnam
**
** This file is part of the Vietnamese Spell Teach project.
**
**All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
**
****************************************************************************/

#include <QGuiApplication>

#include <QQmlContext>
#include <QQmlApplicationEngine>

#include <QRect>
#include <QScreen>
#include <QMessageBox>
#include <QDesktopWidget>
#include <QStandardPaths>

#include "translation.h"

#include "version.h"

int main(int argc, char *argv[])
{
    qputenv("QT_AUTO_SCREEN_SCALE_FACTOR", "1");
    qputenv("QT_SCALE_FACTOR", "1");

#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    //Reset locale
    QLocale::setDefault(QLocale(QLocale::English, QLocale::UnitedStates));

    QGuiApplication app(argc, argv);

    app.setOrganizationName(VER_COMPANYNAME_STR);
    app.setOrganizationDomain(VER_COMPANYDOMAIN_STR);
    app.setApplicationName(VER_PRODUCTNAME_STR);
    app.setApplicationVersion(VER_PRODUCTVERSION_STR);

    Translation translator;

    QScreen *screen = QGuiApplication::screens().at(0);

    qreal dpi;
    qreal pdpi;

#if defined (Q_OS_WIN)
    dpi = screen->logicalDotsPerInch() * app.devicePixelRatio();
    pdpi = screen->physicalDotsPerInch() * app.devicePixelRatio();
#elif defined(Q_OS_ANDROID)
    dpi = 96;
    pdpi = 96;
#else
    dpi = screen->physicalDotsPerInch() * app.devicePixelRatio();
    pdpi = screen->physicalDotsPerInch() * app.devicePixelRatio();
#endif

    //Get Desktop Screen Size
    QRect rect = QGuiApplication::primaryScreen()->geometry();

    QString applicationLocalPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

    QString applicationDirPath = QGuiApplication::applicationDirPath();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();

    context->setContextProperty("screenDpi", dpi);
    context->setContextProperty("physicalDPI", pdpi);
    context->setContextProperty("screenPixelWidth", rect.width());
    context->setContextProperty("screenPixelHeight", rect.height());

    context->setContextProperty("applicationPath", applicationDirPath);
    context->setContextProperty("localDataPath", applicationLocalPath);

    context->setContextProperty("translator", (QObject*)&translator);

    engine.addImportPath("qrc:/");

    engine.setOfflineStoragePath(applicationLocalPath);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
