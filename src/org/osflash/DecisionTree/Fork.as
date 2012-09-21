/**
 * User: Makai Media Inc.
 * Date: 9/21/12
 * Time: 1:27 PM
 */
package org.osflash.DecisionTree {

	public class Fork {
		public var _target:Branch;
		public var _content:*;
		private var _targetID:String;
		public function Fork(targetID:String, content:String) {
			  _targetID = targetID;
			  _content = content;
		}

		public function get target():Branch {
			return _target;
		}

		public function get content():String {
			return _content;
		}

		public function set target(target:Branch):void {
			_target = target;
		}

		public function get targetID():String {
			return _targetID;
		}
	}
}
