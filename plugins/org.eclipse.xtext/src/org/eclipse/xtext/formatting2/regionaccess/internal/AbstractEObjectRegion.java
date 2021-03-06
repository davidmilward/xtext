/*******************************************************************************
 * Copyright (c) 2014 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.formatting2.regionaccess.internal;

import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.formatting2.regionaccess.IEObjectRegion;
import org.eclipse.xtext.formatting2.regionaccess.IHiddenRegion;
import org.eclipse.xtext.formatting2.regionaccess.ISemanticRegion;
import org.eclipse.xtext.formatting2.regionaccess.ITextRegionAccess;

import com.google.common.collect.Lists;

/**
 * @author Moritz Eysholdt - Initial contribution and API
 */
public abstract class AbstractEObjectRegion extends AbstractTextSegment implements IEObjectRegion {
	private final ITextRegionAccess access;
	private IHiddenRegion nextHidden;
	private IHiddenRegion previousHidden;
	private EObject semantcElement;
	private final List<ISemanticRegion> semanticRegions = Lists.newArrayList();

	public AbstractEObjectRegion(AbstractRegionAccess access) {
		super();
		this.access = access;
	}

	public IHiddenRegion getLeadingHiddenRegion() {
		return previousHidden;
	}

	@Override
	public int getLength() {
		return nextHidden.getOffset() - getOffset();
	}

	@Override
	public IHiddenRegion getNextHiddenRegion() {
		return nextHidden;
	}

	@Override
	public ISemanticRegion getNextSemanticRegion() {
		return nextHidden.getNextSemanticRegion();
	}

	@Override
	public int getOffset() {
		return previousHidden.getEndOffset();
	}

	@Override
	public IHiddenRegion getPreviousHiddenRegion() {
		return previousHidden;
	}

	@Override
	public ISemanticRegion getPreviousSemanticRegion() {
		return previousHidden.getPreviousSemanticRegion();
	}

	@Override
	public EObject getSemanticElement() {
		return semantcElement;
	}

	@Override
	public List<ISemanticRegion> getSemanticLeafRegions() {
		return semanticRegions;
	}

	@Override
	public ITextRegionAccess getTextRegionAccess() {
		return access;
	}

	public IHiddenRegion getTrailingHiddenRegion() {
		return nextHidden;
	}

	protected void setLeadingHiddenRegion(IHiddenRegion leading) {
		this.previousHidden = leading;
	}

	protected void setSemantcElement(EObject semantcElement) {
		this.semantcElement = semantcElement;
	}

	protected void setTrailingHiddenRegion(IHiddenRegion trailing) {
		this.nextHidden = trailing;
	}
}