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

import "../theme"

ItemDelegate {
    id: button

    property bool isActive: index === leftPanelIndex

    property bool hoverButton: false

    signal clicked()

    focusPolicy: Qt.NoFocus

    highlighted: false

    background: Rectangle {
        color: "transparent"
        border.color: "transparent"
        radius: 0
    }

    Item {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        width: AppTheme.tscale(24)
        height: AppTheme.tscale(24)

        Image {
            id: icon
            width: AppTheme.tscale(24)
            height: AppTheme.tscale(24)

            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/vitrages/images/panel/" + modelData.icon
            opacity: isActive ? leftPanel.activeOpacity : leftPanel.inactiveOpacity
        }

        ColorOverlay {
            id: colorOverlay
            visible: button.isActive
            anchors.fill: icon
            source: icon
            color: "#00aaff"
        }
    }

    ToolTip {
        id: tooltip

        visible: hoverButton

        contentItem: Text {
            text: modelData.name
            color: "#777777"
        }

        delay: 1000
        timeout: 0

        background: Rectangle {
            color: "white"
            border.color: "#333333"
            radius: 0
        }
    }

    MouseArea {
        anchors.fill: parent
        anchors.margins: 0

        hoverEnabled: true

        cursorShape: Qt.PointingHandCursor

        onEntered: {
            tooltip.x = mouseX + AppTheme.hscale(10)
            tooltip.y = mouseY

            button.hoverButton = true
        }

        onExited: button.hoverButton = false

        onClicked: {
            mousePosition = mouse
            leftPanelIndex = index

            button.clicked()
        }
    }
}
