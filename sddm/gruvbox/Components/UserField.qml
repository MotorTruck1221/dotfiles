import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
  id: userField
  height: inputHeight
  width: inputWidth
  selectByMouse: true
  echoMode: TextInput.Normal
  selectionColor: config.bg
  renderType: Text.NativeRendering
  font {
    family: config.Font
    pointSize: config.FontSize
    bold: true
  }
  color: config.bg
  horizontalAlignment: Text.AlignHCenter
  placeholderText: "Username"
  text: userModel.lastUser
  background: Rectangle {
    id: userFieldBackground
    color: config.fg
    radius: 3
  }
  states: [
    State {
      name: "focused"
      when: userField.activeFocus
      PropertyChanges {
        target: userFieldBackground
        color: config.aqua
      }
    },
    State {
      name: "hovered"
      when: userField.hovered
      PropertyChanges {
        target: userFieldBackground
        color: config.purple
      }
    }
  ]
  transitions: Transition {
    PropertyAnimation {
      properties: "color"
      duration: 300
    }
  }
}
