Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPNkDniOy2kuIwYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Mar 2026 11:06:00 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA19366B1B
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Mar 2026 11:05:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC5EE3F96E
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Mar 2026 09:05:58 +0000 (UTC)
Received: from yug-MacBookPro.lan (89-81-10-116.abo.bbox.fr [89.81.10.116])
	by lists.linaro.org (Postfix) with ESMTPS id A45D63F760
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 19:41:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=gmail.com (policy=none);
	spf=softfail (lists.linaro.org: 89.81.10.116 is neither permitted nor denied by domain of yug@yug.be) smtp.mailfrom=yug@yug.be
Received: by yug-MacBookPro.lan (Postfix, from userid 1000)
	id A9B57A87720; Mon, 30 Mar 2026 21:41:21 +0200 (CEST)
From: Yug Merabtene <yug.merabtene@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie
Date: Mon, 30 Mar 2026 21:41:19 +0200
Message-Id: <20260330194121.987920-1-yug.merabtene@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329184124.775392-1-yug.merabtene@gmail.com>
References: <20260329184124.775392-1-yug.merabtene@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Spam-Level: **
X-MailFrom: yug@yug.be
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OGU5ZUPO4RN5JP3PFEMEEZVY3Z34XFOT
X-Message-ID-Hash: OGU5ZUPO4RN5JP3PFEMEEZVY3Z34XFOT
X-Mailman-Approved-At: Tue, 31 Mar 2026 09:05:48 +0000
CC: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Yug Merabtene <yug.merabtene@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/2] staging: use bounded formatting helpers in fbtft/greybus
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OGU5ZUPO4RN5JP3PFEMEEZVY3Z34XFOT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,animalcreek.com,nexus-software.ie];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[yugmerabtene@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.linux.dev,gmail.com];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 0FA19366B1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This small cleanup series replaces open-coded sprintf() usage in a set of
staging drivers with helpers intended for bounded and sysfs-safe formatting.

Patch 1 updates fbtft logging strings to use scnprintf().
Patch 2 converts Greybus sysfs show paths to sysfs_emit(), including
normalizing attributes that were missing a trailing newline.

Changes in v3:
- add commit message rationale in both patches (why each change is needed)
- no code changes compared to v2

Yug Merabtene (2):
  staging: fbtft: use scnprintf() for log strings
  staging: greybus: switch sysfs show paths to sysfs_emit()

 drivers/staging/fbtft/fbtft-core.c             |  8 +++++---
 drivers/staging/greybus/arche-apb-ctrl.c       | 12 ++++++------
 drivers/staging/greybus/arche-platform.c       | 10 +++++-----
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 drivers/staging/greybus/gbphy.c                |  2 +-
 drivers/staging/greybus/light.c                |  4 ++--
 drivers/staging/greybus/loopback.c             | 14 +++++++-------
 7 files changed, 32 insertions(+), 30 deletions(-)

-- 
2.34.1
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
