Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EevJH08nmkrUQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:13 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B27818E425
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7E7C440499
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 00:04:12 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	by lists.linaro.org (Postfix) with ESMTPS id 96AD04048B
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 19:05:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=MIgJMxIe;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.215.174 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e5998f90dso1977680a12.1
        for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959920; x=1772564720; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FuowrmXWz5fweQD82lQddocIRrSqNVvenJqi997sYE=;
        b=MIgJMxIexUtF4zIAoOjPQzezIA6qt9mmMYztimRBbWppEJUGcnLrtIyrtUaP7x1iiX
         g2jlVi2PVDj4q4bWkCy7cgo7k6UT0bqk3iSfEJTTKE0KySg3uuV9fhQAqFjcesCfhwuT
         54k3xMRbZL0/vn4XcwUy5rcaphAvaJb9sA+Flg8UFG/OlbU4B0wrSB2WOSlWKCzql8MW
         o6zLzQiTm7e2ZKA8H+4daQHsbSF1HnyjlqeJqS6UHVw+uuGeglJMkKQQc3LOxgJAwl0Z
         PiJoqKdvV8LhtBuRCwmKULizI/rXqYtHaQz45rcTaWcAEW2Q+dsqVYEQS2atC8knhjyz
         zRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959920; x=1772564720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FuowrmXWz5fweQD82lQddocIRrSqNVvenJqi997sYE=;
        b=uQXlPLHE5FjPnn81af46ea0Uhbbg+z95UN2cZpYhul2WS7HE+hjoNETdEJJQ0PTz0H
         9cRWs52d0l2Kg3RvktWq7RjCRuVx+KhqL8HuHAL1Xzo+JkYt/SFIWCbfpEZZSSuc3cai
         tmAVwoyQlr959VE4AC+IKNFeyzVgPzcKotTN/e1rui9OOpNzL9K6/66Getsuen22B+db
         Y3tgeFscG9UBFq+836oqAsiFBPYUFypiqyo/Wfd7RiVF2DybXPev0OaVRn2hFiRWGs1u
         f773kVFV5270j7yVIqt111K5g3emYlBM52sR9zm/7HCw/EBTCsclWQuRWdXitRd5dtJe
         dyXg==
X-Forwarded-Encrypted: i=1; AJvYcCWx8oLCQ+2GpaGfqqivHz8EAn1fQRJT7UTmi6ccykHuOVfAy+oiClKlyQYZOw08xGwYTQ9LmHCxUFjnRA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzHbn2ILUumHk3CK5Ady/tCprRzOFa7PWBnCFQFdkn8J1KrakjW
	5tOShZdkW7/j3FSuF0fcXwO4kq1CUyFEjzzcP0D1cV62+NY1GfdFoLLi
X-Gm-Gg: ATEYQzyFIyFKGO2YkQPSmC5+RBlNfAmpf9H6gdmo1RurVNwBp1OiETnKJ38th51ttbL
	WXoz/nGxpPLvIa2TieUrheUn6u/22I62+Tv0tTPH3ztBeBlrT3i/WRUAEAueoRhzC30/cqf4t6T
	8ALcsDP+HDMq72qI9KGDcAmQxCWR1MRNkvmYRB2qvqhf7rAF7T8M53eiKND4vQuwbAOinRP+xJR
	Banj9OnvxBQGZd1s/kLeerF1GJQ/Haq0G8YT9ny4WAGCspcIKY3gctPqbL5rMZRUJmgxom54hmn
	jNHFlWE9m1Vbl3+J4kQwpt7ayoy6oRzXpZT0RBx7zZHb2FbFZF/r7Y9EvN2qgW4TUyGUopxoV9H
	nD1WYbc6kMUF2CxOouJQVByFeNlReZqG2yuvwLBSu21IXDd3bCI0+MdqMV11CO15bxA7aDMtGoE
	PDxCR4p2Q2Lp+B/CBvFte1EdZnV1SH7fCw+To=
X-Received: by 2002:a17:90b:3d8c:b0:354:b2f6:b4e4 with SMTP id 98e67ed59e1d1-358ae6adc2amr9880998a91.0.1771959919516;
        Tue, 24 Feb 2026 11:05:19 -0800 (PST)
Received: from fedora ([2409:40e5:11e8:25ba:c234:5daa:9801:9675])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359029d9d2fsm566993a91.13.2026.02.24.11.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:05:18 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 25 Feb 2026 00:35:04 +0530
Message-ID: <20260224190506.23334-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026022438-gamma-blog-1561@gregkh>
References: <2026022438-gamma-blog-1561@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KZQZAU3XLFBP6WVUR5RPMD2MSTYK77VT
X-Message-ID-Hash: KZQZAU3XLFBP6WVUR5RPMD2MSTYK77VT
X-Mailman-Approved-At: Wed, 25 Feb 2026 00:03:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KZQZAU3XLFBP6WVUR5RPMD2MSTYK77VT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 6B27818E425
X-Rspamd-Action: no action

SGkgR3JlZywNCg0KWW91IGFyZSByaWdodC4gVGhlIFxuIGFkZGl0aW9ucyB3ZXJlIGEgbWlzdGFr
ZSBvbiBteSBwYXJ0IOKAlCB0aGUgb3JpZ2luYWwNCnNwcmludGYgY2FsbHMgZGlkIG5vdCBpbmNs
dWRlIFxuIGFuZCBJIHNob3VsZCBub3QgaGF2ZSBjaGFuZ2VkIHRoZSBvdXRwdXQNCmJlaGF2aW9y
IGluIHRoZSBzYW1lIHBhdGNoLg0KDQpJIHdpbGwgc2VuZCBhIHY0IHRoYXQgZG9lcyBhIHB1cmUg
bWVjaGFuaWNhbCBjb252ZXJzaW9uIGZyb20gc3ByaW50ZiB0bw0Kc3lzZnNfZW1pdCB3aXRoIG5v
IGNoYW5nZSBpbiBvdXRwdXQsIGtlZXBpbmcgdGhlIGZvcm1hdCBzdHJpbmdzIGlkZW50aWNhbA0K
dG8gdGhlIG9yaWdpbmFscy4NCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQpTaHViaGFt
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5v
cmcK
