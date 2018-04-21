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
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1

import "../dialogs"
import "../theme"
import "../navigation"

import "../scripts/global.js" as Global
import "../scripts/branding.js" as Branding

Frame {
    property bool lineSection: false

    property bool drawerVisible: true

    property bool topSpacing: true

    property string title: Branding.VER_APPNAME_STR + " " + Branding.APP_VERSION_SHORT

    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0

    topPadding: topSpacing ? AppTheme.headerTopPadding : 0

    Layout.fillWidth: true

    background: Rectangle {
        color: "transparent"
        border.color: "transparent"
        radius: 0
    }

    property var navigationModel: [
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("New") + translator.tr, "icon": "new.png" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Open") + translator.tr, "icon": "open.png" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Save") + translator.tr, "icon": "save.png" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Save As") + translator.tr, "icon": "save_as.png" },
        {"type": "../navigation/DrawerDivider.qml", "name": "", "icon": "" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Import") + translator.tr, "icon": "import.png" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Export") + translator.tr, "icon": "export.png" },
        {"type": "../navigation/DrawerDivider.qml", "name": "", "icon": "" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Feedback") + translator.tr, "icon": "feedback.png" },
        {"type": "../navigation/DrawerDivider.qml", "name": "", "icon": "" },
        {"type": "../navigation/DrawerNavigationButton.qml", "name": qsTr("Quit") + translator.tr, "icon": "quit.png" },
        {"type": "../navigation/DrawerDivider.qml", "name": "", "icon": "" },
        {"type": "../navigation/DrawerNavigationTextButton.qml", "name": qsTr("About this App") + translator.tr, "icon": "" }
    ]

    property int navigationIndex: 0

    onNavigationIndexChanged: {
        switch (navigationIndex) {
            case 0: // New
                break;
            case 1: // Open
                fileOpenDialog.open()
                break;
            case 2: // Save
                fileSaveDialog.open()
                break;
            case 3: // Save as
                fileSaveDialog.open()
                break;
            case 5: // Import
                break;
            case 6: // Export
                break;
            case 8: //Feedback
                Qt.openUrlExternally("http://www.vitrages-decision.com/en/#encontact")
                break;
            case 10: // Quit
                quitMessageDialog.open()
                break;
            case 12: // About this app
                aboutDialog.open()
                break;
            case 4: // Devider
            case 7: // Devider
            case 9: // Devider
            case 11: // Devider
            default:
                break;
        }

        navigationIndex = -1
    }

    ColumnLayout {
        id: columnLayoutTitle
        Layout.fillWidth: true
        anchors.fill: parent

        spacing: 0

        Frame {
            id: frameHeader

            topPadding: 0
            bottomPadding: 0
            leftPadding: AppTheme.hscale(50)
            rightPadding: AppTheme.hscale(50)

            Layout.fillWidth: true

            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
                radius: 0
            }

            RowLayout {
                Layout.fillWidth: true
                anchors.fill: parent

                RoundButton {
                    id: btnDrawer

                    visible: drawerVisible

                    Layout.preferredWidth: AppTheme.tscale(80)
                    Layout.preferredHeight: AppTheme.tscale(80)

                    padding: AppTheme.tscale(22)

                    contentItem: Image {
                        id: drawerIcon

                        fillMode: Image.PreserveAspectFit

                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter

                        width: AppTheme.tscale(32)
                        height: AppTheme.tscale(32)

                        source: "qrc:/vitrages/images/menu_indicator.png"
                    }

                    background: Rectangle {
                        color: "#09a6f9"
                        opacity: 0.9
                        radius: AppTheme.tscale(50)
                    }

                    MouseArea {
                        id: mouseAreaDrawer
                        anchors.fill: parent
                        anchors.margins: 0
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            navigationBar.open()
                       }
                    }
                }

                Item {
                    // horizontal spacer item
                    Layout.preferredWidth: AppTheme.hscale(30)
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                    } // to visualize the spacer
                }

                Button {
                    id: btnBack
                    text: qsTr("Back") + translator.tr

                    font {
                        weight: Font.Light
                        capitalization: Font.AllUppercase
                        pointSize: AppTheme.textSizeTitleSmall
                    }

                    visible: stackView.currentIndex > 0

                    contentItem: Text {
                        text: btnBack.text
                        font: btnBack.font

                        color: "#000000"

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: {
                        bottomMenuIndex = previousBottomIndex
                    }

                    background: Rectangle {
                        implicitWidth: AppTheme.hscale(150)
                        implicitHeight: AppTheme.vscale(50)

                        color: btnBack.pressed ? "#09a6f9" : "#ffffff"
                        border.color: "transparent"
                        radius: AppTheme.tscale(10)
                        opacity: 0.8
                    }
                }

                Item {
                    // horizontal spacer item
                    Layout.fillWidth: true
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                    } // to visualize the spacer
                }

                Label {
                    id: lblTitle
                    text: title
                    color: "#ffffff"

                    font {
                        capitalization: Font.AllUppercase
                        weight: Font.Bold
                        bold: true
                        pointSize: AppTheme.textSizeHeader
                    }

                    Layout.preferredWidth: AppTheme.hscale(650)
                    Layout.preferredHeight: AppTheme.hscale(90)

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    background: Rectangle {
                        color: "#09a6f9"
                        opacity: 0.6
                        radius: AppTheme.tscale(10)
                    }
                }

                Item {
                    // horizontal spacer item
                    Layout.fillWidth: true
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                    } // to visualize the spacer
                }

                Label {
                    id: lblUsername
                    text: username === "" ? qsTr("Guest") + translator.tr : username
                    color: "#09a6f9"

                    font.pointSize: AppTheme.textSizeText
                    font.weight: Font.Normal

                    verticalAlignment: Text.AlignVCenter
                }

                RoundButton {
                    id: btnLogo

                    Layout.preferredWidth: AppTheme.tscale(70)
                    Layout.preferredHeight: AppTheme.tscale(70)

                    contentItem: Image {
                        id: image

                        anchors.fill: parent
                        anchors.margins: 0

                        property bool rounded: true
                        property bool adapt: false

                        fillMode: Image.PreserveAspectFit

                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter

                        Layout.preferredWidth: AppTheme.tscale(70)
                        Layout.preferredHeight: AppTheme.tscale(70)

                        source: avatarImagePath

                        layer.enabled: rounded

                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: image.width
                                height: image.height
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: image.adapt ? image.width : Math.min(image.width, image.height)
                                    height: image.adapt ? image.height : width
                                    radius: Math.min(width, height)
                                }
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        anchors.margins: 0
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            registerDialog.open()
                        }
                    }
                }
            }
        }
    }

    // The sliding Drawer
    DrawerNavigationBar {
        id: navigationBar
    }

    FileDialog {
        id: fileOpenDialog
        title: qsTr("Open %1 Case File").arg(Branding.VER_APPNAME_STR) + translator.tr

        folder: shortcuts.documents
        selectExisting: true
        selectMultiple: false

        nameFilters: [Branding.VER_APPNAME_STR + qsTr(" File (*.sv)") + translator.tr]

        onAccepted: {
            console.log("Open file: " + fileUrl)
        }
    }

    FileDialog {
        id: fileSaveDialog
        title: qsTr("Save %1 Case File").arg(Branding.VER_APPNAME_STR) + translator.tr

        folder: shortcuts.documents
        selectExisting: false
        selectMultiple: false

        nameFilters: [Branding.VER_APPNAME_STR + qsTr(" File (*.sv)") + translator.tr]

        onAccepted: {
            console.log("Save file: " + fileUrl)
        }
    }

    MessageDialog {
        id: quitMessageDialog
        title: Branding.VER_PRODUCTNAME_STR
        text: qsTr("Are you sure you want to quit this application?") + translator.tr
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Yes | StandardButton.No

        onYes: {
            Qt.quit()
        }
    }
}
