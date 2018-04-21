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

pragma Singleton

import QtQml 2.2
import QtQuick 2.10

QtObject
{
    id: root

    readonly property real refScreenWidth: 1920
    readonly property real refScreenHeight: 1080

    readonly property real contentScaleFactor: screenDpi / 96;

    function dp(value) {
        return Math.round(value * contentScaleFactor)
    }

    function hscale(size) {
        return dp(Math.round(size * (screenPixelWidth / refScreenWidth)))
    }

    function vscale(size) {
        return dp(Math.round(size * (screenPixelHeight / refScreenHeight)))
    }

    function tscale(size) {
        return dp(Math.round((hscale(size) + vscale(size)) / 2))
    }

    readonly property real screenWidthSize: dp(screenPixelWidth)
    readonly property real screenHeightSize: dp(screenPixelHeight)

    readonly property real screenPadding: tscale(12)
    readonly property real propertyPadding: tscale(9)

    readonly property real headerTopPadding: vscale(20)
    readonly property real headerRightPadding: hscale(20)

    readonly property real lineHeight: vscale(3)

    readonly property real titleVerticalPadding: vscale(10)
    readonly property real titleHorizontalPadding: hscale(20)

    readonly property real logoDisplaySize: hscale(200)

    readonly property int textSizeHeader: tscale(33)
    readonly property int textSizeTitle: tscale(23)
    readonly property int textSizeTitleSmall: tscale(20)
    readonly property int textSizeTitleTiny: tscale(18)
    readonly property int textSizeText: tscale(16)
    readonly property int textSizeMenu: tscale(12)
    readonly property int textSizeTabButton: tscale(15)
    readonly property int textSizeSmall: tscale(14)
    readonly property int textSizeContact: tscale(16)
    readonly property int textSizeMessage: tscale(10)
    readonly property int textSizeTiny: tscale(10)

    readonly property int buttonBorderMargin: tscale(-8)
    readonly property int buttonBorderPadding: tscale(10)
    readonly property int buttonSpacing: tscale(50)

    readonly property real switchRadius: tscale(3)
    readonly property real switchSize: tscale(22)
    readonly property real switchImplicitWidth: hscale(60)
    readonly property real switchImplicitHeight: vscale(26)

    readonly property real comboBoxRadius: tscale(13)
    readonly property real comboBoxImplicitWidth: hscale(120)
    readonly property real comboBoxImplicitHeight: vscale(40)

    readonly property real checkBoxRadius: tscale(3)
    readonly property real checkBoxSize: tscale(22)
    readonly property real checkBoxImplicitWidth: hscale(52)
    readonly property real checkBoxImplicitHeight: vscale(26)
    readonly property real checkBoxPadding: tscale(10)
    readonly property real checkBoxSpacing: tscale(10)

    readonly property real radioButtonRadius: tscale(15)
    readonly property real radioButtonSize: tscale(22)
    readonly property real radioButtonImplicitWidth: hscale(52)
    readonly property real radioButtonImplicitHeight: vscale(26)
    readonly property real radioButtonPadding: tscale(8)
    readonly property real radioButtonSpacing: tscale(10)

    readonly property real rowSpacing: vscale(16)
    readonly property real columnSpacing: hscale(20)

    readonly property real dialogLeftBorder: hscale(20)

    readonly property real listViewHeight: vscale(120)

    readonly property real avatarDisplaySize: tscale(300)
}
