package model2.control;

import model2.action.Action;
import model2.action.IndexAction;

public class ActionFactory {
	private static ActionFactory factory;

	private ActionFactory() {
	}

	public static synchronized ActionFactory getInstance() {
		if (factory == null) {
			factory = new ActionFactory();
		}
		return factory;
	}
	//url을 분석하고 해당되는 xxxaction 객체를 만들고 return해준다.
	public Action getAction(String cmd) {
		Action action = null;
		if (cmd.equals("index")) {
			action = new IndexAction();
		}
		return action;
	}
}