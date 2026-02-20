Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFTZHBsfmGn0AgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:15 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D0165DE2
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4FDC43F8EE
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:45:14 +0000 (UTC)
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	by lists.linaro.org (Postfix) with ESMTPS id 5E56C3F797
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 06:30:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=arIV9jy4;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 185.70.43.101 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771569007; x=1771828207;
	bh=E83ONfZnqyHZtuZXpb0GZApa4xUNgnlMeDlbhltn2fA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=arIV9jy4rUld8d1GXPDMvXObTLrnf/x79/eJKnKQUzo92tYTpcRX+O63Op+1FnTmD
	 t28B984+uGsTVuAOSbDzXKw+UU+2gfEd/yAt80SpIKfkIQgIVS3198clbFzgImtW9b
	 GMZtz8JK47x9MYJH2qE1DYQEOfbOPfIo+5wB8qQ5r8Tn3oiYxuU/lYwFk/TgAVsHKR
	 fLb0NhcX/FquqVN5k8kNu5QKx1Ptl+2M+K4bNm7VKkee2eNLXS2bE5hlZ60W3xaU48
	 CpLmJhVAgEipgxEsvyYxKQAFGDhg041J62e6jxFh9T207tyP20ZWTmjnNtrBr2w1uy
	 VMX37tOs0LxSw==
Date: Fri, 20 Feb 2026 06:30:01 +0000
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <20260220062741.399677-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 04199aef8432e15796c9dd366aa051f63f0d9d47
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QJHTIJLHEMTJXU7TNPLW2LJZ27HYUOXR
X-Message-ID-Hash: QJHTIJLHEMTJXU7TNPLW2LJZ27HYUOXR
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:53 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/2] staging: greybus: audio: small fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QJHTIJLHEMTJXU7TNPLW2LJZ27HYUOXR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[pm.me:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,pm.me:mid]
X-Rspamd-Queue-Id: 451D0165DE2
X-Rspamd-Action: no action

Changes in v2:
- Resent using git-send-email (previous submission had incorrect formatting).
- No code changes.

This series contains two small fixes for the Greybus audio manager:

1) Fix a NULL dereference in gb_audio_manager_get_module().
2) Drop a stale TODO in the module release callback.

Both are correctness / cleanup fixes with no functional change beyond preventing crashes.

Thanks,
Hardik

Hardik Phalet (2):
  staging: greybus: audio: fix NULL dereference in
    gb_audio_manager_get_module()
  staging: greybus: audio: drop stale TODO in module release

 drivers/staging/greybus/audio_manager.c        | 3 ++-
 drivers/staging/greybus/audio_manager_module.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
