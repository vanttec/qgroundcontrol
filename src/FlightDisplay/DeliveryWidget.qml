/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

import QtLocation
import QtPositioning
import QtQuick.Window
import QtQml.Models

import QGroundControl
import QGroundControl.Controllers
import QGroundControl.Controls
import QGroundControl.FactSystem
import QGroundControl.FlightDisplay
import QGroundControl.FlightMap
import QGroundControl.Palette
import QGroundControl.ScreenTools
import QGroundControl.Vehicle

Item {
  id: _title_root

  property bool isHidden: false

  states: [
    State {
      name: "hidden"
      when: _title_root.isHidden
      PropertyChanges { target: _title_background; visible: false }
      PropertyChanges { target: _title; visible: false }
      PropertyChanges { target: _hideButton; text: qsTr("Show") }
      AnchorChanges   { 
	target: _hideButton; 
	anchors.top:    undefined; 
	anchors.right:  undefined;
	anchors.bottom: parent.bottom;
	anchors.left:   parent.left;
      }
    },
    State {
      name: "visible"
      when: !_title_root.isHidden
      PropertyChanges { target: _title_background; visible: true }
      PropertyChanges { target: _title; visible: true }
      PropertyChanges { target: _hideButton; text: qsTr("Hide") }
      AnchorChanges   { 
	target: _hideButton; 
	anchors.top:    parent.top; 
	anchors.right:  parent.right;
	anchors.bottom: undefined;
	anchors.left:   undefined; 
      }
    }
  ]

  Rectangle {
    id: _title_background
    color:          QGroundControl.globalPalette.toolbarBackground
    //anchors.top:    parent.verticalCenter
    anchors.top:    parent.top
    anchors.left:   parent.left
    anchors.right:  parent.right
    anchors.bottom: parent.bottom
  }

  // Button for hiding the widget
  Button {
    id: _hideButton
    text: qsTr("Hide")
    //anchors.top:    parent.verticalCenter
    anchors.top:    parent.top
    anchors.right:  parent.right
    anchors.bottom: undefined
    anchors.left:   undefined
    onClicked: {
      _title_root.isHidden = !_title_root.isHidden
    }
  }

  Text {
    id: _title
    color: QGroundControl.globalPalette.text
    text: qsTr("Delivery")
    font.pixelSize: 50
  }
}
