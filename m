Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2jlIK3PDUGrt4gIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:31 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DD73969E
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="oIZ/Bb2y";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F2D740F26
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 10:03:30 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	by lists.linaro.org (Postfix) with ESMTPS id 3E99440AE5
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jul 2026 07:42:39 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a377223171so239244eaf.2
        for <greybus-dev@lists.linaro.org>; Fri, 10 Jul 2026 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669358; x=1784274158; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kNMWIhd4Kn6qK++so+3j3gVzZtTmvgc+EmxNrLVjwPQ=;
        b=oIZ/Bb2yqWn2ZtvPsR5VIeSZbvWDfRG020+dQYwFln+lXk1sS1mUjul9iCHkMjDV3J
         m4mAmvEuqd73gSx0f1IHNKsGJgILzTY02MWse6FiZzFJ58cevoZeOpNCeVtnB1kLRApc
         Ap3DaMHhpsJX2mLBSB260gjvWq1hXn7Bc0M+yh1Vdl2Ps+BpNLhw6f3tFh5eb70jZXUy
         s/uvEhyW6LBOYCit2jQLX1yWDhQyTww8MJ7I0XVeLXP3SZkhYLpyopB8WSrfPBHoW5s6
         m/dyLns2sJEM7Tn3Z24f+hSR5Tk+/bcifgQZMw7m3/0jXctbNKa8jUGVvC4LXb82twlN
         FKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669358; x=1784274158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNMWIhd4Kn6qK++so+3j3gVzZtTmvgc+EmxNrLVjwPQ=;
        b=SJoipxn0x52G00gTGl5Fba/2fdSBMRm8G8MJaFVTssOwhfx3CKHKbUtpYoFdXaLI72
         CyWHZlcXWdq2SZwX/tDLjeUwoeCwNnVCpUsD6YlyBoU07azZ21IvNlD3Jze5X+jeCOsk
         I7AIsdrrcAtZwB/zNWwdCG97TBnxhpGisumnxtuvJl8uLGHVlGrx2Rq7QYMNTQUfMoOm
         CXt86wUXGm3yQ8AweVpQaA/vrAmPq5V2H+vhEHvEnrg+EmheVLh2+G0BoWR+t+twpIOs
         UlPvM4zp87g3Ypu0qt2fm1rKufjjub4GLsxEA3Vl2XnoHzVmSUOBi0ueeKE/FNV5v9xz
         x1fg==
X-Forwarded-Encrypted: i=1; AFNElJ/Sk+UdXmhNy15mGqN5/z0vh2W2UN/YO+kYUagRiPT51V178/JoKdenC537RMQHdKW55w8NWY91LsiFnA==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywo+DImTnr9bNdzV6tjODoDxqaRCIpDZP+vMwFm3IrWHfEi/Uvz
	aJKSzDvB09MGXKyWQ7YL3uG5cNzZJB7m5PlkH4yExFtVytgcVzonZLN9
X-Gm-Gg: AfdE7cm+73JUiZz2En447QN4UtfnZZOQTh26mF4qbBiEmii0MzF5DYhF3g3MPytmplx
	S6DYTd7fU0Nxjm8T1i5puWWdJSCZTJVZXj1+haXtFmlb4cBnqIOvr0uFd6AOsIoQUQiHJnquTF5
	GGo0nkfcGUmn2sOGZfu214kR71qqDWxmTtYFR7b/ok6ORsgfRjBR0xBFaxChRExHpAv9O5m4Nr+
	A9CrfLPu7X5lG3zM0m1DNJkCPHya76fshF/r/Uc4QcxXu9CQdkVvuqNXWpEk1tZevLvFQeFcBEj
	rVUTsAGFJW6uWZslb5wb5p8X6UE14stVL97LyMW0LyoJ1EogsTvPMnckACYPNZWftfcKh5UaQNh
	9E9eguJZDKb89aHkNtXn9uG4fUEyeYqk8DWoONVDqjL+MW3YhEgjADGsE0cCKu37rdP7Lxc0/bf
	QYwIYA
X-Received: by 2002:a05:6820:981:b0:6a3:8023:f343 with SMTP id 006d021491bc7-6a38023f3b7mr3977072eaf.16.1783669358539;
        Fri, 10 Jul 2026 00:42:38 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38b9ccff2sm1158317eaf.3.2026.07.10.00.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:42:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:42:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Message-ID: <alCiZxAXbPDq3P4e@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
 <ak_tgJC8-d1HPKuV@stanley.mountain>
 <20260710124050.31335.alvinhuang0603@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710124050.31335.alvinhuang0603@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5JTMICS3P6CLWFAUHS4PQM3DXKJ5CK2H
X-Message-ID-Hash: 5JTMICS3P6CLWFAUHS4PQM3DXKJ5CK2H
X-Mailman-Approved-At: Fri, 10 Jul 2026 10:03:14 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5JTMICS3P6CLWFAUHS4PQM3DXKJ5CK2H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alvinhuang0603@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F8DD73969E

So the patch has already been merged and it's fine.  The fix is
correct.

On Fri, Jul 10, 2026 at 12:40:50PM +0800, Hao-Qun Huang wrote:
> On Jul 10, 2026 at 2:50 AM, Dan Carpenter <error27@gmail.com> wrote:
> > The bug is not hard to understand, the issue is that this changes the
> > function completely...  Was nothing checking the return before?
> 
> It gets checked.  The value flows unchanged through __hid_hw_raw_request()
> to the callers, and they look at it two ways:
> 
>  - hidraw returns it straight to userspace (write(), HIDIOCSFEATURE),
>    where it is the number of bytes transferred.
> 
>  - in-kernel SET_REPORT callers, some testing "ret < 0" (hid-multitouch,
>    hid-sony), some testing "ret != size" (hid-gt683r, hid-lenovo,
>    hid-razer).
> 
> So the old return 0 was wrong both ways: the first group had a failed
> SET_REPORT masked as success, and the second saw every SET_REPORT as a
> failure.  Returning the count or a negative errno is what GET already
> does in this driver and what usbhid/i2c-hid/uhid return, so nothing
> working with those relied on the 0.

What I'm trying to say is, sure, it's easy to see the code is buggy but
it's been that way for years.  Your patch changes the return completely
from always returning zero to never returning zero.  When we're reviewing
this patch we want to know how making that change is safe.

In staging often the answer is that nothing was calling that function and
we can delete it...

But here, the real answer is that almost nothing checks for errors.  For
the few places that do, almost all of them only check for negatives.
That's probably how the code was able to work as it is...  The commit
message it should explain the risks.

"Changing this code is fine because almost nothing checks for errors.
There are a one or two in kernel checks which care about the exact
positive return and this patch will fix that but basically not much is
affected.  And hopefully userspace doesn't check either or it only checks
for negative errors.  But in the spirit of correctness, lets change this
return to be return the number of bytes and if userspace needs adjusting
we will deal with that when users file their bug reports."

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
