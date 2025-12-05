import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
	anchors {
		top: true
		left: true
		right: true
	}

	implicitHeight: 30

	Text {
		id: clock
		anchors.centerIn: parent

		Process {
			id: dateProc
			command: ["date", "+%Y-%m-%d %H:%M"]
			running: true

			stdout: StdioCollector {
				onStreamFinished: clock.text = this.text
			}
		}

		Timer {
			interval: 10000
			running: true
			repeat: true
			onTriggered: dateProc.running = true
		}
	}
}
