Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIrjGw0fmGn0AgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:01 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DF165DCD
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E7B53F9B2
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:45:00 +0000 (UTC)
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	by lists.linaro.org (Postfix) with ESMTPS id EE42B401F4
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 05:44:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b="FVFkPSs/";
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 109.224.244.116 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566263; x=1771825463;
	bh=R76UmX9/00ElZTMV+xfZ7SP0EVshDWTf3qMR1/xDN1M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FVFkPSs/KKQeX4QbSOhsWvrhQIemtR7Yp6oQzDZJ6jF98B0NtbvYwGHHY1Tl1/vky
	 iwUxTF8bD1AahJfUtPJKQ0MnP+UKAYSwb0XS9i1QOutQ2ptOet9vcuHTJWOaSvJsMv
	 fVeGSQlNppLOnNY5ZXjVPWduklhjJUU6eluQ3ekIA4BsCODGi7LJo4vPzZSKDewNek
	 XhIz+sqmNxAN4doLu0irREXdCo5dgv0gJeNiPGwDuz6Sj1uAwTsW3iMOO4sMqPaZcr
	 xvcht7FysVSqG7sJPdSdmi28lvo2gB2WnOUYzNus78CgCSK5JlzFzy0mrgEbGLzXqs
	 RAq+veSHs7Bpw==
Date: Fri, 20 Feb 2026 05:44:19 +0000
To: Hardik Phalet <hardik.phalet@pm.me>, linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: a67a8913e30025287f99030ae81b3a00d8b874bf
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o"
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TC2Q2DAVQWNCF5DXSYFD3AMMXGRI6UF4
X-Message-ID-Hash: TC2Q2DAVQWNCF5DXSYFD3AMMXGRI6UF4
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TC2Q2DAVQWNCF5DXSYFD3AMMXGRI6UF4/>
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
X-Rspamd-Queue-Id: 4C7DF165DCD
X-Rspamd-Action: no action

--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message
--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o
Content-Type: text/x-patch; charset=utf-8; name=0001-staging-greybus-audio-fix-NULL-dereference-in.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-staging-greybus-audio-fix-NULL-dereference-in.patch

RnJvbSAzYjQ5NmEwZGFhOGNiYmJlNTBhN2EwOWU2ZGFmN2JiNGQ4ZTZlOWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJkaWsgUGhhbGV0IDxoYXJkaWsucGhhbGV0QHBtLm1lPgpE
YXRlOiBGcmksIDIwIEZlYiAyMDI2IDEwOjQxOjQ5ICswNTMwClN1YmplY3Q6IFtQQVRDSCB2MSAx
LzJdIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBmaXggTlVMTCBkZXJlZmVyZW5jZSBpbgogZ2Jf
YXVkaW9fbWFuYWdlcl9nZXRfbW9kdWxlKCkKCmdiX2F1ZGlvX21hbmFnZXJfZ2V0X21vZHVsZSgp
IGNhbGxzIGdiX2F1ZGlvX21hbmFnZXJfZ2V0X2xvY2tlZCgpLCB3aGljaApjYW4gcmV0dXJuIE5V
TEwgd2hlbiB0aGUgcmVxdWVzdGVkIGlkIGRvZXMgbm90IGV4aXN0LiBUaGUgcmV0dXJuZWQKcG9p
bnRlciBpcyBkZXJlZmVyZW5jZWQgdW5jb25kaXRpb25hbGx5IHZpYSBrb2JqZWN0X2dldCgpLCBs
ZWFkaW5nIHRvIGEKTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgoKT25seSB0YWtlIGEga29iamVj
dCByZWZlcmVuY2Ugd2hlbiB0aGUgbW9kdWxlIGlzIGZvdW5kLgoKU2lnbmVkLW9mZi1ieTogSGFy
ZGlrIFBoYWxldCA8aGFyZGlrLnBoYWxldEBwbS5tZT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19tYW5hZ2VyLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX21hbmFnZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIu
YwppbmRleCAyN2NhNWY3OTZjNWYuLjFkYTg4MDRlNjFjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX21hbmFnZXIuYwpAQCAtMTExLDcgKzExMSw4IEBAIHN0cnVjdCBnYl9hdWRpb19t
YW5hZ2VyX21vZHVsZSAqZ2JfYXVkaW9fbWFuYWdlcl9nZXRfbW9kdWxlKGludCBpZCkKIAogCWRv
d25fcmVhZCgmbW9kdWxlc19yd3NlbSk7CiAJbW9kdWxlID0gZ2JfYXVkaW9fbWFuYWdlcl9nZXRf
bG9ja2VkKGlkKTsKLQlrb2JqZWN0X2dldCgmbW9kdWxlLT5rb2JqKTsKKwlpZiAobW9kdWxlKQor
CQlrb2JqZWN0X2dldCgmbW9kdWxlLT5rb2JqKTsKIAl1cF9yZWFkKCZtb2R1bGVzX3J3c2VtKTsK
IAlyZXR1cm4gbW9kdWxlOwogfQotLSAKMi41My4wCgo=

--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o--

