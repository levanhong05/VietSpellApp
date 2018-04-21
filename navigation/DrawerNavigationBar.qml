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

import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.2

import "../theme"

import "../scripts/branding.js" as Branding

Drawer {
    id: drawerVD

    property alias navigationButtons: navigationButtonRepeater
    property real activeOpacity: 0.87
    property real inactiveOpacity: 0.56

    property bool highlightActiveNavigationButton : false

    width: Math.min(_mainWindow.width, _mainWindow.height) / 3

    height: _mainWindow.height

    padding: 0

    background: Rectangle {
        color: "#0d384e"
    }

    Flickable {
        contentHeight: myButtons.height
        anchors.fill: parent

        clip: true
        interactive: false

        Column {
            id: myButtons
            focus: false

            anchors.left: parent.left
            anchors.right: parent.right

            anchors.fill: parent

            spacing: AppTheme.vscale(20)

            Image {
                source: "qrc:/vitrages/images/product_mask.png"

                fillMode: Image.PreserveAspectFit

                width: drawerVD.width
            }

            Repeater {
                id: navigationButtonRepeater

                model: navigationModel

                Loader {
                    Layout.fillWidth: true
                    source: modelData.type
                    active: true
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}
