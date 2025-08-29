Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6BB3D060
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 02:51:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 499A245938
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 00:51:00 +0000 (UTC)
Received: from nie.jgshslywhwlw.com (nie.jgshslywhwlw.com [179.61.221.77])
	by lists.linaro.org (Postfix) with ESMTP id 6443144485
	for <greybus-dev@lists.linaro.org>; Fri, 29 Aug 2025 16:58:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=jnxxjs.com header.s=default header.b="lvc/95+/";
	spf=neutral (lists.linaro.org: 179.61.221.77 is neither permitted nor denied by domain of dirt735@solarcooker-at-cantinawest.com) smtp.mailfrom=dirt735@solarcooker-at-cantinawest.com;
	dmarc=pass (policy=none) header.from=jnxxjs.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=jnxxjs.com;
 h=To:Subject:Message-ID:Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=3Kl6g5OhrNV9bpUosNYFY8KRrK3hHXp220ZH6VizVAk=;
 b=lvc/95+/+iX+ucHpLqRv/hpJol8DVoKwf12v1MBdQXLe/aaIVjz9uZQfGBxM3GTlutes1sPpDSYT
   i7HeC9B3hizi2i20kcDiUMrnboksHIJoKviPcnzySDMj6ugVeWxkBpysH4THPqYrDVysiJkmisj7
   mEPCfcxeaPcICGcZnAZkyueV/3gM6n5xDxa+nreRCTP1YKiJinJTb4d+mQWa4ovpvAsv88sPAulv
   uO4yKmD5wqRwd03noHgF2M90zvs4xDdW3VblufS+NPCzBYYg97DrGT1BYrygLTLONIuMOdOK6k/k
   BMZw1CCyH6KC9JFmaQQ44JHfsOCVc8NXZrt0fhq3vJZfWmk5DzT5wqdWUivyB0SR397RPgJDOGOo
   aqKye3345vQVwrQlVj88vkQEyXVRS8SHz2OpgrkMcK/NHsPPPdQnb1OAr33Xn3/nCLoUT3BEzoHu
   OyDYxpcXhZvDQbJDrMDntXuA0Ku0nEHyu3LFIr7jZWNUx6znTpA9kBfqVB9FonpbB4zkehiNGTZj
   49j+YAqh8v+eFnAwS3qkPiUXbVgxcbbuY6ZxBlJv4amZ5tfBopGT+2IEUUCyieQSYnSH1i5pH36z
   ytyvZBHYaFuLfyCBWeXP66u7AKxf4c792dt5tBpsm3fHJKwIj1JinZC9eSpWSpsk2Nk2+OJW2Jg=
To: greybus-dev@lists.linaro.org
Message-ID: <d6c65a2ecf09e6339112aa4377e5cb92@lastweek2>
Date: Fri, 29 Aug 2025 18:53:06 +0200
From: "High Performance" <dirt@jnxxjs.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: *
X-Rspamd-Queue-Id: 6443144485
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.40 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[jnxxjs.com,none];
	FORGED_SENDER(0.30)[dirt@jnxxjs.com,dirt735@solarcooker-at-cantinawest.com];
	MIME_HTML_ONLY(0.20)[];
	R_DKIM_ALLOW(-0.20)[jnxxjs.com:s=default];
	ONCE_RECEIVED(0.10)[];
	BAYES_SPAM(0.00)[10.33%];
	R_SPF_NEUTRAL(0.00)[?all:c];
	DKIM_TRACE(0.00)[jnxxjs.com:+];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:211301, ipnet:179.61.221.0/24, country:DE];
	MIME_TRACE(0.00)[0:~];
	RWL_MAILSPIKE_POSSIBLE(0.00)[179.61.221.77:from];
	NEURAL_HAM(-0.00)[-0.879];
	HAS_REPLYTO(0.00)[quality@jnxxjs.com];
	FROM_NEQ_ENVFROM(0.00)[dirt@jnxxjs.com,dirt735@solarcooker-at-cantinawest.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-MailFrom: dirt735@solarcooker-at-cantinawest.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IO3E6XELI3CYH63KSR6R23XRCDPOM52B
X-Message-ID-Hash: IO3E6XELI3CYH63KSR6R23XRCDPOM52B
X-Mailman-Approved-At: Sun, 31 Aug 2025 00:50:44 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Reply-To: quality@jnxxjs.com
Subject: [greybus-dev] q did you have a chance to look at the email we sent last week?
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IO3E6XELI3CYH63KSR6R23XRCDPOM52B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1070259264325440058=="

--===============1070259264325440058==
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
</head>
<body>
Hello,<br />
<p>We specialize in high-performance electric bicycles.<br />With a
product=
ion capacity of 50,000 units per year and global warehouses,<br />we
guaran=
tee fast shipping (3&ndash;7 days) to Europe, the US, and beyond.<br /><br
=
/>Our dirt electric bicycle redefines off-road riding:<br />8000W peak
mid-=
mounted motor<br />Top speed 50MPH (Sports Mode)<br />72V 30Ah battery, up
=
to 60 miles range<br />Hydraulic disc brakes for safety<br />MNT
suspension=
 for comfort<br /><br />We also manufacture 5000W electric scooters for
cit=
y and adventure riders.<br />If you would like to receive a quotation or
ex=
plore dealership opportunities,<br />please reply with your address and we
=
will offer you the lowest price possible.<br /><br />Best regards,<br
/>Dar=
ren Wang<br />High-performance Electric Bicycle</p>
<br />
</body>
</html>


--===============1070259264325440058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1070259264325440058==--
