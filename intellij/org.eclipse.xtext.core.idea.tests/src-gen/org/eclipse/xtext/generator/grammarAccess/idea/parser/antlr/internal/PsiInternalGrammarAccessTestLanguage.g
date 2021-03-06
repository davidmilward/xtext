/*
 * generated by Xtext
 */
grammar PsiInternalGrammarAccessTestLanguage;

options {
	superClass=AbstractPsiAntlrParser;
}

@lexer::header {
package org.eclipse.xtext.generator.grammarAccess.idea.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.eclipse.xtext.generator.grammarAccess.idea.parser.antlr.internal;

import org.eclipse.xtext.idea.parser.AbstractPsiAntlrParser;
import org.eclipse.xtext.generator.grammarAccess.idea.lang.GrammarAccessTestLanguageElementTypeProvider;
import org.eclipse.xtext.idea.parser.TokenTypeProvider;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.generator.grammarAccess.services.GrammarAccessTestLanguageGrammarAccess;

import com.intellij.lang.PsiBuilder;
}

@parser::members {

	protected GrammarAccessTestLanguageGrammarAccess grammarAccess;

	protected GrammarAccessTestLanguageElementTypeProvider elementTypeProvider;

	public PsiInternalGrammarAccessTestLanguageParser(PsiBuilder builder, TokenStream input, GrammarAccessTestLanguageElementTypeProvider elementTypeProvider, GrammarAccessTestLanguageGrammarAccess grammarAccess) {
		this(input);
		setPsiBuilder(builder);
    	this.grammarAccess = grammarAccess;
		this.elementTypeProvider = elementTypeProvider;
	}

	@Override
	protected String getFirstRuleName() {
		return "Root";
	}

}

//Entry rule entryRuleRoot
entryRuleRoot:
	{ markComposite(elementTypeProvider.getRootElementType()); }
	ruleRoot
	EOF;

// Rule Root
ruleRoot:
	(
		(
			{
				markComposite(elementTypeProvider.getRoot_ElementsTypeParserRuleCall_0ElementType());
			}
			lv_elements_0_0=ruleType
			{
				doneComposite();
			}
		)
	)*
;

//Entry rule entryRuleType
entryRuleType:
	{ markComposite(elementTypeProvider.getTypeElementType()); }
	ruleType
	EOF;

// Rule Type
ruleType:
	(
		{
			markComposite(elementTypeProvider.getType_ATypeParserRuleCall_0ElementType());
		}
		ruleAType
		{
			doneComposite();
		}
		    |
		{
			markComposite(elementTypeProvider.getType_AnotherTypeParserRuleCall_1ElementType());
		}
		ruleAnotherType
		{
			doneComposite();
		}
	)
;

//Entry rule entryRuleAType
entryRuleAType:
	{ markComposite(elementTypeProvider.getATypeElementType()); }
	ruleAType
	EOF;

// Rule AType
ruleAType:
	(
		{
			markLeaf(elementTypeProvider.getAType_FooKeyword_0ElementType());
		}
		otherlv_0='foo'
		{
			doneLeaf(otherlv_0);
		}
		(
			{
				precedeComposite(elementTypeProvider.getAType_ATypeAction_1ElementType());
				doneComposite();
			}
		)
	)
;

//Entry rule entryRuleAnotherType
entryRuleAnotherType:
	{ markComposite(elementTypeProvider.getAnotherTypeElementType()); }
	ruleAnotherType
	EOF;

// Rule AnotherType
ruleAnotherType:
	(
		{
			markLeaf(elementTypeProvider.getAnotherType_BarKeyword_0ElementType());
		}
		otherlv_0='bar'
		{
			doneLeaf(otherlv_0);
		}
		(
			{
				precedeComposite(elementTypeProvider.getAnotherType_AnotherTypeAction_1ElementType());
				doneComposite();
			}
		)
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
