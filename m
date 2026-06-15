Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v57RK8dmMWoZigUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:07:51 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FB690C53
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:07:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=yahoo.pl header.s=s2048 header.b=lNEUGYKV;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=yahoo.pl (policy=reject)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EA5AA40A6A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 15:07:49 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	by lists.linaro.org (Postfix) with ESMTPS id DA9F23F7DA
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1781525633; bh=3rd8+g+P+9wiYZhDEUBBno5EWYovta7N74iS6sPbuoE=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=lNEUGYKV/GyGqE5amJ21vmMxQarrKPKWGBfPK9GYtDzybDfjdnglaPGD+qDpx9tWXlgi/cLTT+pea7eip8UKsZDQhikTXIL8p8GPG3/l5Mco51sIo6j3NtLze8B/L+wtCQVoiWgaoV0OapAv3OITGNp/Hr+OPgdUNsE570tGMfWnHlRqif4ZFHWXHl2kk28xp09gYXYZGqF9rBuLEcHUqUGAg6LO7xcXJyERTju4BTYGRUt6enrdjHRHXr2ug58FnEPwU2f2YzCsMn+JVrS9xtLP8U8CvQiH2018UD5teOdbpzTWZWkj/JbBP+LY/bQ3ZOJiBt6z6jJ5E3+Pq03xuQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1781525633; bh=v/D2iRSnCtnHbeyg8CgCOhEiN0L/cfb1PHtDWzAI4cz=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Ord7yMJce2S5sGCbjvFY+QQDUFTwHQ0Ve+vjGaGVzI9RwDnmoAsI7tVzFhP0SyT++QBdgeJ0cQKt1beTmeViEL8wDdYcWGapRem/qjUch4Bj4wDxY1VH7Tul7ykQ0NMqNehT2ZJPO0Nv+IGlE1CLLM05glVvyxhCdkQlxQ7kpebgAl8bfXivo/ahmo2yBJ0wJBNP9Ba8kfConc2ZJfsADOpUYDXi35VXAjyFZRcmXKeWiCTvdUL7q5pTi2bkNESkgPX03HTbuuTd8bmJL0Odiimq6Frd9YGygHWTF4EHW45zKMP4NTY9G8Q4l59Vu2OGh62Yx7stnuXPHhT8ndtaYw==
X-YMail-OSG: LCsh_5QVM1kjf2hpyRXbZRJY2J9mL2GOe3uyBHdEqLC8V4YTAlTPeMPccn5K26l
 M7VzPW8.76fQO2c63kmfkSZFfpKNgcofMq_7.IxvwB6J.ARgU5oQfb0E0I5Xr1HthTBR.5ut6l3w
 VmUeMlO933cqsGkmVL8jyxbrmyGbI.v8fhQ2esoolUjNDCUhpR9MdJ31fge3MxpSSzeVcELE9ZSH
 taYK0zQEBZE7n.GQLhvYeSWr890_849zuM9KZhpP98JpotIuLMvdVkxv43qMHxYi8_cTWquDa_l0
 S6qBkCqEU1N.5KMfho8xMR9bSJUJ4GXjR.5vkRt1eBmbnvOvB_sjVx8aoFG7ZdBiVtCRsQ0VoISp
 H.rsf90HtttcnLvqfFWlbFNUkfNSf9LyCwTdNilyxlNswxh_gjJw_aobAHEAyTJWNNxqH.mOsHMr
 wHvB5CNQrCn7PQmXfZgz7jhZDbXIAGa9UhgrEfh8wmxZPbP8vZSInBhl5hnUpJiKGun.uaeeZISZ
 evwWaphOzzjxFuf7KbG.YZKIMJCzvWmvc1h2.6Z8Ru.KdalJd4GyV6Ha8DvVD0IQ0JVkU6phM8Jv
 5eIQ63j2SXNvfeZqwK1JprpEimRfKh8LLEVefuGbJha2t33foEq8HlR89CeEtuyklxFP3ZhZXJDp
 mVvelgwQuwWa1cAbYqMHm4kKuSF7_f.DTJxVQE2joG68zndvAhv6IF5B9r6uByiwXMc9G5TokILq
 Z1tOawrvIt8w8mDA4huQ9ViiJmBJVWbDJUub.tIJD3WLQpNDztrZusg4jpEzVbEaw343XdoNaF3y
 utNfSe6j6kBouFNN4efMk2OZpEGC.5ufkX1QLDHCwI2LgfQuDmxUHaW8y_G2TaBTvriewADnoJ_g
 y.6gOGJgzpZ.ZH8lVJK8zYChv2sIlQmqjUqrW4TFatKoGnaeFjaFALITtY2MzvULotSrElPFT1GX
 zCxdW2H6e_42UKWqbD.KGyF6QutHuad4K6qo1aPZLC9ABQSpkib0o4CSfvJB_PBxdrrqUpz1C42X
 pa0lrhLT9b.PPapAUHIiz.SHBc2CxAg0KSoxx9feSO1y9nyBVJ5fi2hgkoHMIDdmz.nM7eh2d37.
 sTngNSuGb131LJYNlqueu6hMdUgSGW_vMp5pifaUQ2oi1cQgsKQxCirfUmogC_2jWx13xhaaP7A3
 JBT.oUa9wg4SCDz_VJpL2C4j81B0_fyezjNRer4GsFKUFqf15I3ryZ8DQJoCoxR8xydg5D8FwUUS
 Cu.RezHAdXwEce06NviBgugH7f0cKlvcaySvgq6USwqYa7PLLSNrgrNz2vjHBcN8Ia25bZHuZT2u
 F1E_umUS2iDSdSBPtAUC49oVtljNktKJcV5m5xRDXXBQyCuryD.Dj5z66sxw8.7ntzDSU2pQyGEh
 9iyFeNnIs9nZ5cbu66eKc3aJh7wQYdUkUkbc0AVOMS5vXFb6e6RTc5i4QeNXb3Z657wFkvfsF.HQ
 Jn_eCbhHqK.YBwBNLRm_ntgtRKjWO2pWJNv._c0_R6HTeu5od7FF5Yf.wiaz9DrNyKJtiYJpbT7m
 Ez05L.xdf9TWSnN0pveLf8mnX.Zlr7JTKJTjemRujkcoEg3nkvV.plevXvnRNuI00lPfoCuFtvjV
 kOP8zhiQ6XtT_uCfl72XjJIy1Zcr17zvrle6dGuTbULWCU.Ek1IZJeOTeMBkroY0ljEhZ8Lp.A9u
 PTLFTVwdsQwsBPaRBbG.G3ukyB3F1HCRkk3490mKlIRtEvVEO8ay_DzpDzZUoUC1WMIA.rl3r2sY
 UZmTL8eZTZUVIQf4xvEk2v0ckff4K.ey_uVetcia8JL2myaGZfvN7Az5skj2vsvasMay3lARuXtS
 Qc2cze7dUNvdrRenkoluMXhK4hws_z_oI.Mjk6Yh74hoom6h2HYjksenkOH4VEZSA7Zrh5vpih9T
 GqdkW8ytjV9ydiTDMQLrDEycmBwVPR92fFyf00Jx7gEZP__iJLNZLugpjtRtYrv2ygnLCaBytgcV
 3BvDvWcRXHQs2egvNS2kC8tDWD7WbxNZyq5UoB7OlT.3oszSipA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 0409e295-3ac2-4fdf-b1e3-869372b0ec0b
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Mon, 15 Jun 2026 12:13:53 +0000
Received: from dip9.lsn.ir2.yahoo.com ([87.248.99.18])
          by hello (SMTP) with SMTP ID 9b364269beee6ee8cdecf0eeca6edd86;
          Mon, 15 Jun 2026 12:13:51 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 15 Jun 2026 14:13:48 +0200
MIME-Version: 1.0
Message-Id: <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAHvsL2oC/yXNTQ6CQAxA4auQrm0CqKBehbiYn4I1Zpi0DEgId
 3fU5bd5bwMlYVK4FRsIzaw8hozqUIB7mDAQss+GuqybsqnOOAitNinGcSFBTTG+VhSakgSMRig
 o2qP31/5kLq1rIYeiUM/v36S7/63JPslN3zLs+wcnVAevhgAAAA==
X-Change-ID: 20260615-greybus-power-supply-return-parens-b3dd9f4a87c7
To: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781525629; l=1603;
 i=tomasz.unger@yahoo.pl; s=20260611; h=from:subject:message-id;
 bh=dkW4U07h/7yEMXWE6hDuJjC6YfXxB2nasiyluSowMpw=;
 b=onfNI5EmuHdJurs0sxShIxJHWTQ+cESj55fr56y0EhPus4UYMNNIXxBUPHDfDls8LUfXLwVFd
 havtwgNjfRhCEewD41r61qrgaXR67PhvKPF99e9qF1C667KZdN7elqy
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=elW+gk1cZhyVAkPUfX4QaVHbxERM6w8ByGYxz0Rijl0=
References: <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79.ref@yahoo.pl>
X-Spamd-Bar: ----
X-MailFrom: tomasz.unger@yahoo.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4QS6E3X3YXG7XKJYRDBNQF3ZZ3GAGFIX
X-Message-ID-Hash: 4QS6E3X3YXG7XKJYRDBNQF3ZZ3GAGFIX
X-Mailman-Approved-At: Tue, 16 Jun 2026 15:07:46 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: power_supply: remove unnecessary parentheses in return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4QS6E3X3YXG7XKJYRDBNQF3ZZ3GAGFIX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[yahoo.pl : SPF not aligned (relaxed),reject];
	DATE_IN_PAST(1.00)[26];
	R_DKIM_REJECT(1.00)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:tomasz.unger@yahoo.pl,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER(0.00)[tomasz.unger@yahoo.pl,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,yahoo.pl];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,linaro.org:email,yahoo.pl:email,yahoo.pl:mid,yahoo.pl:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED3FB690C53

return is not a function, so the parentheses around the returned
expressions are not needed. Remove them to follow kernel coding
style and silence checkpatch.pl RETURN_PARENTHESES warnings.

Verified with checkpatch.pl - no errors or warnings.
Compiled the power_supply object successfully.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/greybus/power_supply.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index 33b7a63979d6..44bd8a72fa50 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -336,7 +336,7 @@ static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
 
 static int is_prop_valint(enum power_supply_property psp)
 {
-	return ((psp < POWER_SUPPLY_PROP_MODEL_NAME) ? 1 : 0);
+	return (psp < POWER_SUPPLY_PROP_MODEL_NAME) ? 1 : 0;
 }
 
 static void next_interval(struct gb_power_supply *gbpsy)
@@ -423,7 +423,7 @@ static void check_changed(struct gb_power_supply *gbpsy,
 static int total_props(struct gb_power_supply *gbpsy)
 {
 	/* this return the intval plus the strval properties */
-	return (gbpsy->properties_count + gbpsy->properties_count_str);
+	return gbpsy->properties_count + gbpsy->properties_count_str;
 }
 
 static void prop_append(struct gb_power_supply *gbpsy,

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260615-greybus-power-supply-return-parens-b3dd9f4a87c7

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
