Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FD8FCB15
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Jun 2024 13:53:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 58A0940D42
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Jun 2024 11:53:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 059B4402C5
	for <greybus-dev@lists.linaro.org>; Wed,  5 Jun 2024 11:53:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ubZtm4p8;
	spf=pass (lists.linaro.org: domain of sashal@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sashal@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FC66617DF;
	Wed,  5 Jun 2024 11:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A276AC4AF07;
	Wed,  5 Jun 2024 11:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588387;
	bh=kiI/Lw2TK9Xytq4SD7omgBRD9aRnbSVuuUnrkQXDmf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ubZtm4p8c1PCKM6veZi9iLgDWg9WCuFRFNVdTQ7vnDy3yBnB+tC7jVYrbFxAffm46
	 V6MfTFDbqVlu7fDx8n2RGQoqibYlNP9sv8yA/tMltngfMoYX0De+NkFeJ9ksdOCQNP
	 xBfz/VfjQWGd8dH7miX/aSpD51ZMheZDSpWKa56EpBPw21Sgt5GpZdqJps7xqYE0e5
	 NAHxdVOeV9ieVE2N26L6pAEyN+ub3jp9SZgr/LvcxjfI7ov3h+2o6QrX2C3Bwv28qN
	 qfMJ+JRYo6Wa0CIDabM2puKQoPLoMLk7vdUD9WJ4b52S7vqLRR8ZChLXJaT1DaL/vj
	 b8bFkK1Il86hg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  5 Jun 2024 07:51:59 -0400
Message-ID: <20240605115225.2963242-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115225.2963242-1-sashal@kernel.org>
References: <20240605115225.2963242-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 059B4402C5
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[163.com,linuxfoundation.org,kernel.org,lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: U634KKU4WJJ4PJGMUWFJ6XETBNKXC4GW
X-Message-ID-Hash: U634KKU4WJJ4PJGMUWFJ6XETBNKXC4GW
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sicong Huang <congei42@163.com>, Sasha Levin <sashal@kernel.org>, johan@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH AUTOSEL 6.6 16/20] greybus: Fix use-after-free bug in gb_interface_release due to race condition.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U634KKU4WJJ4PJGMUWFJ6XETBNKXC4GW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Sicong Huang <congei42@163.com>

[ Upstream commit 5c9c5d7f26acc2c669c1dcf57d1bb43ee99220ce ]

In gb_interface_create, &intf->mode_switch_completion is bound with
gb_interface_mode_switch_work. Then it will be started by
gb_interface_request_mode_switch. Here is the relevant code.
if (!queue_work(system_long_wq, &intf->mode_switch_work)) {
	...
}

If we call gb_interface_release to make cleanup, there may be an
unfinished work. This function will call kfree to free the object
"intf". However, if gb_interface_mode_switch_work is scheduled to
run after kfree, it may cause use-after-free error as
gb_interface_mode_switch_work will use the object "intf".
The possible execution flow that may lead to the issue is as follows:

CPU0                            CPU1

                            |   gb_interface_create
                            |   gb_interface_request_mode_switch
gb_interface_release        |
kfree(intf) (free)          |
                            |   gb_interface_mode_switch_work
                            |   mutex_lock(&intf->mutex) (use)

Fix it by canceling the work before kfree.

Signed-off-by: Sicong Huang <congei42@163.com>
Link: https://lore.kernel.org/r/20240416080313.92306-1-congei42@163.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/greybus/interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index 9ec949a438ef6..52ef6be9d4499 100644
--- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -694,6 +694,7 @@ static void gb_interface_release(struct device *dev)
 
 	trace_gb_interface_release(intf);
 
+	cancel_work_sync(&intf->mode_switch_work);
 	kfree(intf);
 }
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
