Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIwsGXA8nmkrUQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:00 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46E18E40F
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:03:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 010B640499
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 00:03:59 +0000 (UTC)
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	by lists.linaro.org (Postfix) with ESMTPS id B218A4048B
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 18:54:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=mIt+rIgR;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 79.135.106.28 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771959293; x=1772218493;
	bh=JnJurbv9xGNA5l1meJmsf8wFAKqxDX+/AAKbZcDSXM8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mIt+rIgRAX8Q90cEicFv/mjpNc7KL7zeRVzCiXCJ6etxXKoEOI3VlOX9C4YjO0B21
	 cKdv9CAAl7DXpmHOpuO0JEdxyjvjMnIfyIHAIORtTia2sXrERWqVajliY3KV+lsRIi
	 A5raNOOhL6lfFaIfb8XvGSo7cFfx0lfkN+mU437GvnlpZHyLhxo7qiEzVAZZ5RY1xH
	 Rh++3Tj6q3IMche1rWqqMaTVUnxKGvKQSW/OA3ZFoH21Nkz8t3dTIg5GdLwvf8GwDA
	 +u0MdU3DJuos1OUWdOCQ2UC7ZYR69WjUsZd7B2zcN2mO6W/A1GyGrerHbnyhu9D9Qb
	 ysBpwnI2Xx8sA==
Date: Tue, 24 Feb 2026 18:54:46 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <20260224185421.824210-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 888bb053d7bcff0cfb0fed0f3019fa0c92c892f3
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DAA6W333PIWXZNT7VNPIYGFJXOOJFB5G
X-Message-ID-Hash: DAA6W333PIWXZNT7VNPIYGFJXOOJFB5G
X-Mailman-Approved-At: Wed, 25 Feb 2026 00:03:52 +0000
CC: Dan Carpenter <dan.carpenter@linaro.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/2] staging: greybus: audio: remove dead code and clean up
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DAA6W333PIWXZNT7VNPIYGFJXOOJFB5G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[pm.me:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: EC46E18E40F
X-Rspamd-Action: no action

This series cleans up dead code in the Greybus audio manager.

gb_audio_manager_get_module() has no in-tree callers. The previously
reported NULL dereference is therefore unreachable. Per review feedback,
the unused function is removed to avoid carrying dead code.

Patch 2 performs a small cleanup in the same area.

Changes in v3:
- Replaced the NULL-deref fix with removal of gb_audio_manager_get_module()
  since there are no in-tree callers (per Greg KH).
- No functional changes otherwise.

Thanks for the review.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>

Hardik Phalet (2):
  staging: greybus: audio: remove unused gb_audio_manager_get_module()
  staging: greybus: audio: drop stale TODO comment

 drivers/staging/greybus/audio_manager.c        | 12 ------------
 drivers/staging/greybus/audio_manager.h        |  7 -------
 drivers/staging/greybus/audio_manager_module.c |  1 -
 3 files changed, 20 deletions(-)

-- 
2.53.0


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
