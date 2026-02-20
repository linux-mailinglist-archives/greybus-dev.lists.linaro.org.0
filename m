Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BlBBwkfmGn0AgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:44:57 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1D165DC6
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:44:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 893F0401BB
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:44:55 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lists.linaro.org (Postfix) with ESMTPS id B3C02401F4
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 05:41:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=O8PUulLP;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 185.70.43.22 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566112; x=1771825312;
	bh=+1huOgB43ir7P1leu3NQYddufx0nCeZ2o3NtrpAsLUo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=O8PUulLPISAyWINj8K7GZoBNA8ZC9qt8ggIWByNC4i1eOMTJhH56K/G1UqrqQ75DR
	 4CEgTdm40addkCNuZ/W5P31mvmdRqPEodY/ucLOmwyAIlG5TTr5TFT8sPqeolXM4XS
	 Bv3aCBw/etZ4+7WZ8NsFsRUfSORAvfUJ7z+qwhLhH4p4SsSbFzSUBGrifBaCKrbIP4
	 RwNnMx1how/NJimg/onzfrAfiCqtR+UdnC5FHWP1xs/leZFwCufxMRyRut5MEg7ijJ
	 g80kBq7F+f4ZXxnJFyD3gX9uZU+qkfbtxp+JC5R1u4HkPyMmHDtmt4/rUkTPK2jPp0
	 tJBm4dmUGf2qw==
Date: Fri, 20 Feb 2026 05:41:50 +0000
To: linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 43ad6efd0e3a2bca415310f6e54455951a1f6e96
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk"
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6P2X4BC4YJGS6DMKCZFTTRBSS3Z662GX
X-Message-ID-Hash: 6P2X4BC4YJGS6DMKCZFTTRBSS3Z662GX
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:52 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v1 0/2] staging: greybus: audio: small fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6P2X4BC4YJGS6DMKCZFTTRBSS3Z662GX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:mid,pm.me:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 93E1D165DC6
X-Rspamd-Action: no action

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series contains two small fixes for the Greybus audio manager:

1) Fix a NULL dereference in gb_audio_manager_get_module().
2) Drop a stale TODO in the module release callback.

Both are correctness / cleanup fixes with no functional change beyond
preventing crashes.

Thanks,
Hardik

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk
Content-Type: text/x-patch; charset=utf-8; name=0000-cover-letter.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0000-cover-letter.patch

RnJvbSBiMzgxNzY3NjcyMDIzMjM0ZTZkMTg0ODJhN2I2OGFlYjc4ZmRmMmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJkaWsgUGhhbGV0IDxoYXJkaWsucGhhbGV0QHBtLm1lPgpE
YXRlOiBGcmksIDIwIEZlYiAyMDI2IDExOjAwOjQxICswNTMwClN1YmplY3Q6IFtQQVRDSCB2MSAw
LzJdICoqKiBTVUJKRUNUIEhFUkUgKioqCgoqKiogQkxVUkIgSEVSRSAqKioKCkhhcmRpayBQaGFs
ZXQgKDIpOgogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBmaXggTlVMTCBkZXJlZmVyZW5jZSBp
bgogICAgZ2JfYXVkaW9fbWFuYWdlcl9nZXRfbW9kdWxlKCkKICBzdGFnaW5nOiBncmV5YnVzOiBh
dWRpbzogZHJvcCBzdGFsZSBUT0RPIGluIG1vZHVsZSByZWxlYXNlCgogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYXVkaW9fbWFuYWdlci5jICAgICAgICB8IDMgKystCiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjUzLjAKCg==

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk--

