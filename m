Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKkVFDSSg2lCpQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:44 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9EEBB74
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2809401CE
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 18:38:42 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	by lists.linaro.org (Postfix) with ESMTPS id 3D7BC3F93E
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 18:31:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PY2gD158;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.215.179 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so13982a12.0
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 10:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229883; x=1770834683; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=PY2gD1588fyC0oJjHcdkLHeOmJE3iu9S9ZukT622vUbFiu4H1eY86B09uaUN+9JVoA
         USVInfaYWd5DqRlAnkytpBUtT+0bgzNfBLMU0QvPLt/e5jN0phinX0ciR9F0fp6UNKbu
         cY8Ur7o0hchcXHjGAOQ+pno9nybwSxcOg+7xyEGl1d4o3Fzc4e0ntqdvK35lKHDp3208
         oYunnaWJPUS9xuICvJePZNIddWYRONIwePsEZIN7zAG99+xLCaQnFMA04IWd/7kxsISI
         O15RQHz5dLEoQgtuNryxN1NSCkkMAm+W0WMLc7buBStBENCxAKAFYKvse+Q3KXAggcvt
         bcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229883; x=1770834683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=sLWjSFpEMZ008yvboWu4CUS8M3CPpK1UD/XdAQwBXG2+Y4mdM2FIvGepmhAAqq2DE/
         YJqxfsU7TmQFihg7142k8VivYgOiudf0TE43zclReCWpO18s3CCfprwKU0QGJgw/l3jt
         Q31oPBBHznxU44gR3hk2LfFWMCDtxyVOoh3oAIJmRWXid+V4ZoaHeswfkQGpT6HR9CqX
         SvGbs3FJtEBwZ2SWQiAsXHZWXt14EcV0v/1x0IdaIsnP9VTec5PjW8TiWlX9SxfHto1M
         7LBAY7CM2J88IsF8GCYqvxc6m6/qleE41/IE2NdkNbI4VikAibBoIAIMH5u8peFM+VyN
         H57w==
X-Forwarded-Encrypted: i=1; AJvYcCUXI3PKHE28FDQoYMM769kEU7PJ+V5my9jzmDdzfngC+oYvzf0rkjamwF6gogJMUOL3TDWO60itLuadiQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxteM7OSeDa5rHeMJCtUpFh6kwRq2L3aIHXI06eOq3Of3aDa42W
	d1DqpkoCQUffDyqX+7gE/av3hkaxHddV/bPtgPd41wNesWnK45UIjSpJ
X-Gm-Gg: AZuq6aJ5oG+jxjyZhpO4eANfImrbJOBv9AjJ60P8HxdcrtsG4GB2I0MaOP/AWNq/arg
	1Ld4bh8ImohPTg+o9PEKYA61+TI0w3arqHUy/vMH3uzfxZkmi4QQ8UJkyAu/+DffTfI/XN1/aOM
	stto3iq5OjPt33oT7L/n3Uh/XNouPMeL7tOS8tqqImHYHDJCJaHmkTtbHIH0V/VQoPTx1pYBp1R
	gUrd1JY2KXDgfYlTT7Qn4XK2wX+0KjNT0RmOnP3a+UrD9NkVVwSfdDuUqQBhlVpsOcNIRYNKivF
	2J109YpsPIG4GLTQReu1CIHG/orXNUS29SC1LS8Dl42e+uuEW7KId6y1urOqRazKJiuuM9RHIz9
	Aw7wjsUxkwC362p06S7CctJb/g9Q4b1SLSnjgHsDw7sLER5xfKY4qD91Eoc2kJqahTIdpG209DQ
	JkaxCKj3RLczuTYV2LOoJx3869c6z+
X-Received: by 2002:a17:90b:5606:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-354870aa792mr3814373a91.3.1770229883208;
        Wed, 04 Feb 2026 10:31:23 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487143207sm1725230a91.0.2026.02.04.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:31:22 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Johan Hovold <johan@kernel.org>
Date: Wed,  4 Feb 2026 18:31:13 +0000
Message-ID: <20260204183113.182766-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZNBRZLFMNAASEECMBQJLSRQGAZEDBPTJ
X-Message-ID-Hash: ZNBRZLFMNAASEECMBQJLSRQGAZEDBPTJ
X-Mailman-Approved-At: Wed, 04 Feb 2026 18:38:26 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 3/4] staging: greybus: resolved checkpatch checks for raw.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZNBRZLFMNAASEECMBQJLSRQGAZEDBPTJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: DCE9EEBB74
X-Rspamd-Action: no action

Added comment to mutex declaration, to resolve checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..4f217f20f1c0 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -20,7 +20,7 @@ struct gb_raw {
 
 	struct list_head list;
 	int list_data;
-	struct mutex list_lock;
+	struct mutex list_lock; /* protects gb_raw->list and gb_raw->list_data */
 	dev_t dev;
 	struct cdev cdev;
 	struct device *device;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
