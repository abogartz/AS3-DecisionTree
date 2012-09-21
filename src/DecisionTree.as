package {

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.setTimeout;

	import org.osflash.DecisionTree.Branch;
	import org.osflash.DecisionTree.Fork;

	import org.osflash.DecisionTree.Tree;

	public class DecisionTree extends Sprite {
		private var _textField:TextField = new TextField();

		private var _tree:Tree = new Tree();

		public function DecisionTree() {

			var branch:Branch;
			branch = new Branch("1", "Do you eat meat?", [new Fork("1.1", "yes"), new Fork("1.2", "no")], doChoice);
			_tree.addBranch(branch);
			branch = new Branch("1.1", "Do you like red meat??", [new Fork("1.1.1", "yes"), new Fork("1.1.2", "no")], doChoice);
			_tree.addBranch(branch);
			branch = new Branch("1.2", "Do you like faux-meat?", [new Fork("1.2.1", "yes"), new Fork("1.2.2", "no")], doChoice);
			_tree.addBranch(branch);
			branch = new Branch("1.1.1", "How about a steak?", [new Fork("1", "restart")], doChoice);
			_tree.addBranch(branch);
			branch = new Branch("1.1.2", "How about some chicken?", [new Fork("1", "restart")], doChoice);
			_tree.addBranch(branch);
			branch = new Branch("1.2.1", "How about a veggie burger?", [new Fork("1", "restart")], doChoice);
			_tree.addBranch(branch);
			branch = new Branch("1.2.2", "How about a salad?", [new Fork("1", "restart")], doChoice);
			_tree.addBranch(branch);
			_tree.init();
			trace("Next branch is: " + _tree.currentBranch.content)
			_textField.wordWrap = false;
			_textField.multiline = true;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.text = _tree.currentBranch.content;
			addChild(_textField);
			setTimeout(nextChoice, 3000)

		}

		private function doChoice():void {

			var rand:Number = Math.random() < .5 ? 0 : 1;
			if(_tree.currentBranch.forks.length==1){
				rand=0;
			}
			var fork:Fork = _tree.currentBranch.forks[rand];

			var nextBranch:Branch = _tree.getBranch(fork.target.id);
			_tree.changeBranch(nextBranch);
			if(_tree.currentBranch.id =="1"&&_tree.stack.length>0){
				for (var i:int = 0; i < _tree.stack.length; i++) {
					if (_tree.stack[i].id == "1.1") {
						meatCount++;
					}
					if (_tree.stack[i].id == "1.2") {
						veggieCount++;
					}
				}
				if(veggieCount>=meatCount){
					_textField.text += "\nYou are leaning vegetarian!";
				} else{
					_textField.text += "\nYou should really give up meat!";
				}
			}
			_textField.text += "\nchoice is " + fork.content;
			_textField.text += "\n" + _tree.currentBranch.content;
			var meatCount:int = 0;
			var veggieCount:int = 0;




		}

		private function nextChoice() {
			_tree.currentBranch.evaluate();
			setTimeout(nextChoice, 3000)
		}
	}
}
