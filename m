Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52F51AE14
	for <lists+greybus-dev@lfdr.de>; Wed,  4 May 2022 21:39:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51D7548079
	for <lists+greybus-dev@lfdr.de>; Wed,  4 May 2022 19:39:51 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lists.linaro.org (Postfix) with ESMTPS id 47FB03ED62
	for <greybus-dev@lists.linaro.org>; Sat, 30 Apr 2022 23:01:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 65C2A32000CC;
	Sat, 30 Apr 2022 19:01:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 30 Apr 2022 19:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cason.dev; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1651359700; x=1651446100; bh=N/xeKdPiEGiMGCUIqrcz5n0qw0xVZiMTqUU
	GOCEZfzc=; b=H8UoztDdES/iObmUIaqWkf6EgKg+N0hBgJJpKyFPMRqrKIWOHcw
	cRVnyX3zUCg/DKY5UiuxcGR6/PxkiLgN1t+fRuF+GDAxix+Ojz/833acfYUZWqdT
	rGrcry1ab80iRUUBonSe9/nvUnOe61MjfMR1NyKUi1EfVDOS8OJ2hAxeC1gQucMo
	ngWk7dNP0qqeEr0mbIO+8+1wMzJ3gAycnA3NJkcuSvZqF6FDHOl7nVw7c+pTZnqq
	rwue4igYcNsIu+Gsql5974uwKaDyERg6BPtYuCl3wLl9wpPHZRPXwoe3M8FiUGXd
	KTo4C7z3jMhtg2Sd2Qu1FJQOEMVPJDO5fbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651359700; x=1651446100; bh=N/xeKdPiEGiMG
	CUIqrcz5n0qw0xVZiMTqUUGOCEZfzc=; b=O/ofyBUmAYq6TOE8LOhlp2WFjqVBU
	93nfmZ0C9UKu0h9TdPUEW81BdvQRWagFl19aEQcUfxCo7zleVxP/SZ4JWT4UcUWY
	6niaGQznhT5WBqnF+UumoL6MB8QPl8pSd4sUDDxK7pBqzs2jnADjpEOu+o4CE7GP
	m3zNqKcsh/rceIGHKP9nhzswOuGVFKsh0bj79Prr3dsUFQsQ0yFpsykTX0rh9Maa
	ynoJz0KSRfDqmJXlJzV/IUpNC64GtOTzvdTE6IAJ7XxYw2QUNKDH8vEqBcSHS4qv
	o29TdBZfMoL8IlLz2ukTwCMhU2pqd8Q2slnmx9Y7GvYt4bZTPlEDN4vOw==
X-ME-Sender: <xms:1L9tYrwcDEHNDa-HeNZyHWN3ulf2lsx3YdOjE6TdnmTEWl5KYu6hwQ>
    <xme:1L9tYjRAP2Ep-EXbdUBVVHMRRHoMDtziYQnZOBtJRhthRwJzluXdaZRudKJIfVevI
    3_Rl0hs6qJ-ZQe9Mng>
X-ME-Received: <xmr:1L9tYlVm7XoZofLypOihyXh2-av7C4cRMi9cGrXJJwN-76-Vf1c-zBv8KXx2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesthdtredttd
    dtvdenucfhrhhomheppfhitghkrghlrghsucevrghsohhnuceonhhitghkrghlrghssegt
    rghsohhnrdguvghvqeenucggtffrrghtthgvrhhnpedtudeihfdtffdutdejleelvdefhf
    ekuedtledvjedukeffueetheetfeejjeevleenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehnihgtkhgrlhgrshestggrshhonhdruggvvh
X-ME-Proxy: <xmx:1L9tYlhcRPJa4uTFqj86awSizIit4aHgIQeMrZ0nG0tAlpPoSh_M5g>
    <xmx:1L9tYtAldj83_iaosVXKpt3qCplAXmyphINP6YAQ_I48IrR2x5wk2A>
    <xmx:1L9tYuKV7ecOzhbo7vNWWSfPewLqZtmSRTl2EDbVQWL2LE9beAZtmA>
    <xmx:1L9tYg6e9FaxS6kH8NHq0BKru4Dz-ilBRsNtfOC8WQtaoBcajQyo-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Apr 2022 19:01:40 -0400 (EDT)
Date: Sat, 30 Apr 2022 19:01:39 -0400
From: Nickalas Cason <nickalas@cason.dev>
To: gregkh@linuxfoundation.org
Message-ID: <20220430230139.7i772mvejlhevamn@desktop>
MIME-Version: 1.0
Content-Disposition: inline
X-MailFrom: nickalas@cason.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KOLLMELK3F7AE7NAL5VWOYFCEWUFKOAL
X-Message-ID-Hash: KOLLMELK3F7AE7NAL5VWOYFCEWUFKOAL
X-Mailman-Approved-At: Wed, 04 May 2022 19:39:48 +0000
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: correct typo in comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KOLLMELK3F7AE7NAL5VWOYFCEWUFKOAL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correct misspelling in comment. Issue found with checkpatch.

Signed-off-by: Nickalas Cason <nickalas@cason.dev>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index e374dfc0c92f..fcbd5f71eff2 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -591,7 +591,7 @@ static __maybe_unused int arche_platform_suspend(struct device *dev)
 static __maybe_unused int arche_platform_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.35.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
