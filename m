Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLBOHBIfmGnhAgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:06 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A58165DD4
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FDF1401BB
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:45:05 +0000 (UTC)
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	by lists.linaro.org (Postfix) with ESMTPS id 42FCD401F7
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 05:45:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=GRSZkJw3;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 109.224.244.121 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566347; x=1771825547;
	bh=cEmMqbhC2gyXvYoxSaDX0C67gqTjDU8rf+vypv5h1qE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GRSZkJw3lthk6m8+DPZOnKOHU/WAZYLwXs1L5RaMKna7O278bTP8wxRDZeDSmq8E1
	 MiQoA/KCONnf/9DUM80pqy7QDj5Sz1ly1UY1p6dXx4GDQr95fKKKW7AfnccnovjZdk
	 0Gkn7YXy4cc/ft4zoMlYjc/Gr8MOSXb9fVfqYUBUNZHGIhx0aVpzG1l5zEEhLdv/a/
	 wpViICDqBR2luUu51+QbUl2STHFHulyaSXXee2q+wT6sjQaydJ1/vIKJiz6rZTy8Uy
	 qXp3uASjj9zrwlN1qcSMsRIPlmuI2bx7vEtAYYrZ8i14b3A5Nx5RPs/Kr3E1Iecila
	 vsozhGJn/MREw==
Date: Fri, 20 Feb 2026 05:45:44 +0000
To: Hardik Phalet <hardik.phalet@pm.me>, linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <DGJJURREST2E.1YYACU06X3V9C@pm.me>
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 82b57fac4ec9689d49fac34b65e19b6dfb99c225
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec"
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VIWNFZ7JQINDLYKXTXBYT4HZLCFMGV72
X-Message-ID-Hash: VIWNFZ7JQINDLYKXTXBYT4HZLCFMGV72
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v1 2/2] staging: greybus: audio: drop stale TODO in module release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VIWNFZ7JQINDLYKXTXBYT4HZLCFMGV72/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,pm.me:mid,pm.me:email]
X-Rspamd-Queue-Id: 05A58165DD4
X-Rspamd-Action: no action

--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message
--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec
Content-Type: text/x-patch; charset=utf-8; name=0002-staging-greybus-audio-drop-stale-TODO-in-module-rele.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0002-staging-greybus-audio-drop-stale-TODO-in-module-rele.patch

RnJvbSBiMzgxNzY3NjcyMDIzMjM0ZTZkMTg0ODJhN2I2OGFlYjc4ZmRmMmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJkaWsgUGhhbGV0IDxoYXJkaWsucGhhbGV0QHBtLm1lPgpE
YXRlOiBGcmksIDIwIEZlYiAyMDI2IDEwOjQ2OjUwICswNTMwClN1YmplY3Q6IFtQQVRDSCB2MSAy
LzJdIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBkcm9wIHN0YWxlIFRPRE8gaW4gbW9kdWxlCiBy
ZWxlYXNlCgpNb2R1bGVzIGFyZSByZW1vdmVkIGZyb20gbW9kdWxlc19saXN0IGluIGdiX2F1ZGlv
X21hbmFnZXJfcmVtb3ZlKCkgYW5kCmdiX2F1ZGlvX21hbmFnZXJfcmVtb3ZlX2FsbCgpIGJlZm9y
ZSBrb2JqZWN0X3B1dCgpLiBUaGUgVE9ETyBzdWdnZXN0aW5nCmxpc3QgZGVsZXRpb24gaW4gdGhl
IGtvYmplY3QgcmVsZWFzZSBjYWxsYmFjayBpcyBzdGFsZSBhbmQgbWlzbGVhZGluZy4KClNpZ25l
ZC1vZmYtYnk6IEhhcmRpayBQaGFsZXQgPGhhcmRpay5waGFsZXRAcG0ubWU+Ci0tLQogZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYyB8IDEgLQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
bWFuYWdlcl9tb2R1bGUuYwppbmRleCA0YTRkZmI0MmY1MGYuLmIxZGQzZGE5ZjU3YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYworKysg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jCkBAIC02OSw3
ICs2OSw2IEBAIHN0YXRpYyB2b2lkIGdiX2F1ZGlvX21vZHVsZV9yZWxlYXNlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqKQogCXN0cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZSAqbW9kdWxlID0gdG9f
Z2JfYXVkaW9fbW9kdWxlKGtvYmopOwogCiAJcHJfaW5mbygiRGVzdHJveWluZyBhdWRpbyBtb2R1
bGUgIyVkXG4iLCBtb2R1bGUtPmlkKTsKLQkvKiBUT0RPIC0+IGRlbGV0ZSBmcm9tIGxpc3QgKi8K
IAlrZnJlZShtb2R1bGUpOwogfQogCi0tIAoyLjUzLjAKCg==

--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec--

