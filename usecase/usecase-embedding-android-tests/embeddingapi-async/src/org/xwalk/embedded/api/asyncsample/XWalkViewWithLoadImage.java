// Copyright (c) 2014 Intel Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package org.xwalk.embedded.api.asyncsample;

import android.app.Activity;
import org.xwalk.core.XWalkInitializer;
import org.xwalk.core.XWalkView;

import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;

public class XWalkViewWithLoadImage extends Activity implements XWalkInitializer.XWalkInitListener {
    private XWalkView mXWalkView;
    
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO Auto-generated method stub
		super.onActivityResult(requestCode, resultCode, data);
		if (mXWalkView != null) mXWalkView.onActivityResult(requestCode, resultCode, data);
	}

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        XWalkInitializer.initAsync(this, this);
    }

    @Override
    public final void onXWalkInitStarted() {
        // It's okay to do nothing
    }

    @Override
    public final void onXWalkInitCancelled() {
        // It's okay to do nothing
    }

    @Override
    public final void onXWalkInitFailed() {
        // Do crash or logging or anything else in order to let the tester know if this method get called
    }

    @Override
    public final void onXWalkInitCompleted() {
		// TODO Auto-generated method stub
        setContentView(R.layout.xwview_layout);
        StringBuffer mess = new StringBuffer();
        mess.append("Test Purpose: \n\n")
        .append("Verifies XWalkView can load image.\n\n")
        .append("Expected Result:\n\n")
        .append("Test passes if app load image from you upload.");
        new  AlertDialog.Builder(this)
        .setTitle("Info" )
        .setMessage(mess.toString())
        .setPositiveButton("confirm" ,  null )
        .show();
        mXWalkView = (XWalkView) findViewById(R.id.xwalkview);
        mXWalkView.load("http://jquery.decadework.com/", null);
	}
    
}
