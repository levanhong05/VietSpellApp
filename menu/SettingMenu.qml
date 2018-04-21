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
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtQuick.Controls.Styles 1.4

import "../scripts/branding.js" as Branding

Menu {
    Action { text: qsTr("Settings") + translator.tr }

    Menu {
        title: qsTr("Tools") + translator.tr
        Action { text: "Find Next" }
        Action { text: "Find Previous" }
        Action { text: "Replace" }
    }

//    Menu {
//        title: qsTr("Language") + translator.tr

//        Action { text: "Deutsch (Deutschland)"; icon: "qrc:/vitrages/images/language/germany.png" }
//        Action { text: "English (United States)"; icon: "qrc:/vitrages/images/language/england.png" }
//        Action { text: "Español (España)"; icon: "qrc:/vitrages/images/language/spain.png" }
//        Action { text: "Français (France)"; icon: "qrc:/vitrages/images/language/france.png" }
//        Action { text: "Tiếng Việt (Việt Nam)"; icon: "qrc:/vitrages/images/language/vietnam.png" }
//    }

    MenuSeparator { }

    Action { text: qsTr("Update") + translator.tr }
    Action { text: qsTr("About ") + translator.tr + Branding.VER_APPNAME_STR }
    Action { text: qsTr("Feedback") + translator.tr }

    MenuSeparator { }

    Action { text: qsTr("Quit") + translator.tr }
}
