import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    id: root

    readonly property int    safetyDistance: _controller.mSAFETYDISTANCE     //as static not usable here
    property int             distance: _controller.m_distance



    /////       BINDING-ELEMENT     /////
    Row{
        spacing: 5

        Label{
            id: lblBinding

            height: 40
            width: 250
            verticalAlignment: Qt.AlignVCenter
            font: {font.bold = true; font.pixelSize = 13}
            text: "Binding with Binding element"
        }


        Button{
            id: btnBackward

            text: "Backward"
            focus: true
            enabled: (_controller.m_distance >= _controller.mSAFETYDISTANCE) ? true : false
            onClicked: {
                distance = root.distance - 1;
            }

            Binding{                        // view -> controller/model
                target: _controller
                property: "m_distance"
                value: root.distance
            }
        }

        Label{
            id: lblConclusion

            height: 40
            width: 250
            verticalAlignment: Qt.AlignVCenter
            font: {font.bold = false; font.pixelSize = 13}
            text: "- one binding for each property makes confusing code\n+ reliable binding\n+ logical control in cpp controller"
        }
    }

}
