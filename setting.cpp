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

#include "setting.h"

#include <QApplication>
#include <QSettings>
#include <QStandardPaths>

#include "version.h"

Setting::Setting(QObject *parent) :
    QObject (parent)
{
}

QString Setting::read(QString key, QString group)
{
    QString value = "";

#ifdef Q_OS_WIN
    QSettings settings("HKEY_CURRENT_USER\\Software\\" + QString(VER_COMPANYNAME_STR) + "\\" + QString(VER_PRODUCTNAME_STR) + "\\" + group, QSettings::NativeFormat);
    value = settings.value(key).toString();
#else
    QSettings settings(QString(VER_COMPANYNAME_STR), QString(VER_PRODUCTNAME_STR));

    settings.beginGroup(group);
    const QStringList childKeys = settings.childKeys();

    foreach(const QString &childKey, childKeys) {
        if (childKey == key) {
             value = settings.value(childKey).toString();
        }
    }

    settings.endGroup();
#endif

    return value;
}

QStringList Setting::readAllGroup(QString group)
{
    QStringList values = QStringList();

#ifdef Q_OS_WIN
    QSettings settings("HKEY_CURRENT_USER\\Software\\" + QString(VER_COMPANYNAME_STR) + "\\" + QString(VER_PRODUCTNAME_STR) + "\\" + group, QSettings::NativeFormat);

    const QStringList childKeys = settings.childKeys();

    foreach(const QString &childKey, childKeys) {
        values.append(childKey + ";;" + settings.value(childKey).toString());
    }
#else
    QSettings settings(QString(VER_COMPANYNAME_STR), QString(VER_PRODUCTNAME_STR));

    settings.beginGroup(group);
    const QStringList childKeys = settings.childKeys();

    foreach(const QString &childKey, childKeys) {
        values.append(childKey + ";;" + settings.value(childKey).toString());
    }

    settings.endGroup();
#endif

    return values;
}

void Setting::write(QString key, QString value, QString group)
{
#ifdef Q_OS_WIN
    QSettings settings("HKEY_CURRENT_USER\\Software\\" + QString(VER_COMPANYNAME_STR) + "\\" + QString(VER_PRODUCTNAME_STR) + "\\" + group, QSettings::NativeFormat);
    settings.setValue(key, value);
#else
    QSettings settings(QString(VER_COMPANYNAME_STR), QString(VER_PRODUCTNAME_STR));
    settings.beginGroup(group);
    settings.setValue(key, value);
    settings.endGroup();
#endif
}
