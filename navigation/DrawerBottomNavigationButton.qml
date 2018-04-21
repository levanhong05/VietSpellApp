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
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

import "../theme"

Item {
    id: control

    property bool isActive: index == bottomMenuIndex

    Layout.alignment: Qt.AlignHCenter
    //focusPolicy: Qt.NoFocus

    implicitHeight: AppTheme.vscale(80)
    implicitWidth: (bottomMenuBar.width - AppTheme.hscale(62)) / (bottomMenuModel.length)

    Column {
        spacing: AppTheme.vscale(20)
        topPadding: 0

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: AppTheme.tscale(30)
            height: AppTheme.tscale(30)

            Image {
                id: contentImage

                width: AppTheme.tscale(48)
                height: AppTheme.tscale(48)

                verticalAlignment: Image.AlignTop
                anchors.horizontalCenter: parent.horizontalCenter

                source: "qrc:/vitrages/images/menu_bottom/" + modelData.icon
                opacity: control.isActive ? bottomMenuBar.activeOpacity : bottomMenuBar.inactiveOpacity
            }

            ColorOverlay {
                id: colorOverlay
                anchors.fill: contentImage
                source: contentImage
                color: control.isActive ? "#5bdef0" : "#ffffff"
            }
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: modelData.name
            opacity: control.isActive ? 1.0 : 0.7
            color: control.isActive ? "#5bdef0" : "#ffffff"
            font.pointSize: AppTheme.textSizeText

            font.weight: Font.Light
        }
    }

    MouseArea {
        anchors.fill: parent

        anchors.margins: 0
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            bottomMenuIndex = index
        }
    }
}
