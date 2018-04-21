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
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.1

import "../theme"

import "../scripts/global.js" as Global
import "../scripts/branding.js" as Branding

Frame {
    id: frameHeader

    property string backIconSource: "qrc:/vitrages/images/back.png"
    property string homeIconSource: "qrc:/vitrages/images/header/home.png"
    property string iconSource: ""
    property string quitIconSource: "qrc:/vitrages/images/header/quit.png"
    property string runIconSource : "qrc:/vitrages/images/header/execute.png"
    property string title: ""

    property bool backVisible: true
    property bool homeVisible: true
    property bool iconVisible: true
    property bool quitVisible: true
    property bool runVisible: false

    leftPadding: AppTheme.titleHorizontalPadding
    rightPadding: AppTheme.titleHorizontalPadding
    topPadding: AppTheme.titleVerticalPadding
    bottomPadding: AppTheme.titleVerticalPadding

    Layout.fillWidth: true

    Material.foreground: "white"

    background: Rectangle {
        border.color: "transparent"
        color: "#00aaff"
        radius: 0
    }

    RowLayout {
        anchors.fill: parent
        spacing: AppTheme.screenPadding

        Image {
            id: btnBack

            visible: backVisible

            enabled: stackView.depth > 0

            fillMode: Image.Pad

            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter

            source: backIconSource

            Layout.preferredWidth: AppTheme.tscale(32)
            Layout.preferredHeight: AppTheme.tscale(32)

            MouseArea {
                id: mouseAreaBack
                anchors.fill: parent
                anchors.margins: 0
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    stackView.pop()

                    _mainWindow.bottomMenuIndex = stackView.currentItem.index
                }
            }
        }

        ColorOverlay {
            anchors.fill: btnBack
            source: btnBack
            color: "#000000"
        }

        Image {
            id: btnHome

            visible: homeVisible

            fillMode: Image.PreserveAspectFit

            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter

            source: homeIconSource

            Layout.preferredWidth: AppTheme.tscale(32)
            Layout.preferredHeight: AppTheme.tscale(32)

            MouseArea {
                id: mouseAreaHome
                anchors.fill: parent
                anchors.margins: 0
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    stackView.pop(null)
                }
            }
        }

        Image {
            id: lblIcon
            visible: iconVisible
            source: iconSource

            Layout.preferredWidth: AppTheme.tscale(32)
            Layout.preferredHeight: AppTheme.tscale(32)
        }

        Label {
            id: lblTitle
            text: title

            color: "#ffffff"

            font.weight: Font.Bold
            font.bold: true
            font.pointSize: AppTheme.textSizeTitle

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Item {
            // horizontal spacer item
            Layout.fillWidth: true
            Rectangle {
                anchors.fill: parent
                color: "transparent"
            }
        }

        Image {
            id: btnRun
            visible: runVisible

            fillMode: Image.PreserveAspectFit

            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter

            source: runIconSource

            Layout.preferredWidth: AppTheme.tscale(32)
            Layout.preferredHeight: AppTheme.tscale(32)

            MouseArea {
                id: mouseAreaRun
                anchors.fill: parent
                anchors.margins: 0
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    //swipeView.setCurrentIndex(5)
                }
            }
        }

        Image {
            id: btnQuit

            visible: quitVisible

            fillMode: Image.PreserveAspectFit

            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter

            source: quitIconSource

            Layout.preferredWidth: AppTheme.tscale(32)
            Layout.preferredHeight: AppTheme.tscale(32)

            MouseArea {
                id: mouseAreaQuit
                anchors.fill: parent
                anchors.margins: 0
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    quitMessageDialog.visible = true
                }
            }
        }
    }

    MessageDialog {
        id: quitMessageDialog
        title: qsTr("%1").arg(Branding.VER_PRODUCTNAME_STR) + translator.tr
        text: qsTr("Are you sure you want to quit this application?") + translator.tr
        icon: StandardIcon.Warning
        standardButtons: StandardButton.No | StandardButton.Ok

        onAccepted: {
            Qt.quit()
        }
    }
}
