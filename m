Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A2B3D061
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 02:51:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88FC144209
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 00:51:04 +0000 (UTC)
Received: from nie.jgshslywhwlw.com (nie.jgshslywhwlw.com [179.61.221.77])
	by lists.linaro.org (Postfix) with ESMTP id 26776443FF
	for <greybus-dev@lists.linaro.org>; Fri, 29 Aug 2025 17:25:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=jnxxjs.com header.s=default header.b=IE6nGJ8t;
	spf=neutral (lists.linaro.org: 179.61.221.77 is neither permitted nor denied by domain of dirt394@kfz-oberlausitz.de) smtp.mailfrom=dirt394@kfz-oberlausitz.de;
	dmarc=pass (policy=none) header.from=jnxxjs.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=jnxxjs.com;
 h=To:Subject:Message-ID:Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=3Kl6g5OhrNV9bpUosNYFY8KRrK3hHXp220ZH6VizVAk=;
 b=IE6nGJ8t/rD4Q6E3Vyrbn4l2dvILF5/1b7YgW2ie4A0kyJDBHnbLpWGO369MwZiVejYqvLgGnb+D
   1VmRkgt2H6EvzzON00LeuWe1/wnX0wrWtJDOdaPA52H8Ct40x6ISSDubPrO7sEDro4ZrpD5Ufuac
   itXqDksjJEzExNpK9bvE0nDx4IVsLUAM9nnmU4MRY6tDZwEdLwzDbQjKuxtwCWZjgj7ecipUpSWA
   X6Z17EtufeB0uyKYBTMYnkk1JA9H0pOvSO5+1x9DzQ7AGiWncgE5HabOBRSuACkZpBswRy4t7IKj
   83LKfJ4sXeKJ+rmTkTp91E3KbqIRkAovatlSw1wcsKztACEFXdtzrICI9hpncudvpsVbEsyZqTCZ
   X3sAUZzAuaO64cpW3EPDZH0M7Vd4VXLai4Kd8DT4nVsySXttsZ2jph3q7rPjyd9H0aRJjyjXCSmq
   XbjeUaOUe2pDfbnm52xCiJbYwlUGG2ckjX0tbQFAfgq3g3xS4Mc7t4Kibs7mA7SC1Wydh1hNl9Fb
   918J2Fomwaof9JTcI6nNv16qhG+cWLtPXk+jidHNxmokyLLS49ZXcDVPei+UwZksorWlNyS4MSy0
   do4LdVjt8XVj7550rX46e9tdif8LecT6/ectSc0Og7WLtohYE333kwsUfYJ3LBo8lGfmj2KY6q4=
To: greybus-dev@lists.linaro.org
Message-ID: <a42b5b73b6e76a716eb37df84d15d7ec@lastweek2>
Date: Fri, 29 Aug 2025 18:24:24 +0200
From: "High Performance" <dirt@jnxxjs.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: *
X-Rspamd-Queue-Id: 26776443FF
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.40 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[jnxxjs.com,none];
	FORGED_SENDER(0.30)[dirt@jnxxjs.com,dirt394@kfz-oberlausitz.de];
	MIME_HTML_ONLY(0.20)[];
	R_DKIM_ALLOW(-0.20)[jnxxjs.com:s=default];
	ONCE_RECEIVED(0.10)[];
	BAYES_SPAM(0.00)[10.33%];
	R_SPF_NEUTRAL(0.00)[?all];
	DKIM_TRACE(0.00)[jnxxjs.com:+];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:211301, ipnet:179.61.221.0/24, country:DE];
	MIME_TRACE(0.00)[0:~];
	RWL_MAILSPIKE_POSSIBLE(0.00)[179.61.221.77:from];
	NEURAL_HAM(-0.00)[-0.879];
	HAS_REPLYTO(0.00)[quality@jnxxjs.com];
	FROM_NEQ_ENVFROM(0.00)[dirt@jnxxjs.com,dirt394@kfz-oberlausitz.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-MailFrom: dirt394@kfz-oberlausitz.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OTDE2V7NBATHZJTWRFWQ4Y6O2ZLKPRQN
X-Message-ID-Hash: OTDE2V7NBATHZJTWRFWQ4Y6O2ZLKPRQN
X-Mailman-Approved-At: Sun, 31 Aug 2025 00:50:44 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Reply-To: quality@jnxxjs.com
Subject: [greybus-dev] f did you have a chance to look at the email we sent last week?
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OTDE2V7NBATHZJTWRFWQ4Y6O2ZLKPRQN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2517752344101198137=="

--===============2517752344101198137==
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


--===============2517752344101198137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2517752344101198137==--
