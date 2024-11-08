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
    id: _root
    anchors.left:   parent.left
    anchors.right:  parent.right
    anchors.top:    parent.top
    anchors.bottom: parent.bottom
    
    // Simple big white label in the middle of the screen
    FlyViewToolBar {
        id:         toolbar
        visible:    !QGroundControl.videoManager.fullScreen
    }

    Item { 
      id: _deliveryitem
      anchors.top: toolbar.bottom
      anchors.bottom: parent.bottom
      anchors.left: parent.left
      anchors.right: parent.right

      Label {
        id: _label
        text: qsTr("Delivery View de Vanttec")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 50
        color: "white"
      }
      QGCToolInsets {
          id:                     _toolInsets
          leftEdgeBottomInset:    _pipView.leftEdgeBottomInset
          bottomEdgeLeftInset:    _pipView.bottomEdgeLeftInset
      }
  
      FlyViewWidgetLayer {
          id:                     widgetLayer
          anchors.top:            parent.top
          anchors.bottom:         parent.bottom
          anchors.left:           parent.left
          anchors.right:          guidedValueSlider.visible ? guidedValueSlider.left : parent.right
          z:                      _fullItemZorder + 2 // we need to add one extra layer for map 3d viewer (normally was 1)
          parentToolInsets:       _toolInsets
          mapControl:             _mapControl
          visible:                !QGroundControl.videoManager.fullScreen
          utmspActTrigger:        utmspSendActTrigger
          isViewer3DOpen:         viewer3DWindow.isOpen
      }
   }
}
