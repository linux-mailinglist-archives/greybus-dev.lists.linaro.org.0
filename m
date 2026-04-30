Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FQPATX49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:05 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE84AEFB8
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1E2A406F0
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:03 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	by lists.linaro.org (Postfix) with ESMTPS id 3AFDA404B4
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 18:08:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kjsGEOZV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of sonionwhat@gmail.com designates 209.85.221.66 as permitted sender) smtp.mailfrom=sonionwhat@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso645277f8f.2
        for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 11:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777572527; cv=none;
        d=google.com; s=arc-20240605;
        b=UorORI+4SG/9Jsijksb8P7sc57ZY6StwUw3C0qi2hvVVPWLIFWxiQ8MKYTAPsCBJpc
         aZeQYCl6x47Gc558greG8BYSI6dlwtO3CwAcaCIxKQf9hBDU2W5UXtcC2jfyKl/Jw2NH
         xs2/hjw+erpN2RuOiRaoAocDJGYGKFLGPRsN0nbPtsOT5MZHpxwbfwYWFg9ChxlBedm+
         WLL+iQKJCH+DezNXgsA2uJJAthAGGQqPzaiqyWZdx+MdMvs2ZP+G2tMwWdVUiGZkNvFu
         IUTo4rnysVMSi6vhHCdYUAJpp15g7xsT7ImW0FoZQEvV9Y1ffpzEvwGfWKF+6h8aUTCj
         /tVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qtILulUHLT79WWgPQDmAPEa958VjeDPVeBWr5Lm8OvQ=;
        fh=0h0n4FcFneH1NS5YlPHTUoPf2Ua7DwEvMrtEuN707VM=;
        b=Os8WfhzSepxmG5vixkKv9RTfop9eMb2Beuc5iCapP9P7QC3n+pCOCRF5E2bJw8INeN
         CpSZ+gL/5Ki6h1u3pSlIflSbIvLU/bTqo4SOMOnzGOSLcSzZe26tgZTpnoOGZrhQVTKG
         e5nW4Cs5ZjZNwiL0hr0IoYmI4Mf+QXTemK/zjHPsTyElRRabpYkn221XpKAsjSacuOiN
         OV2hmSX1jbMTRf4IQ72SyRq1qShYAKKq2gpq8SVUbiXFTuOntUzPKqieHmzov72kHfF7
         Bw3tsxrP+AuePvYUpspArA46gq4AAxy/6FsDrfij2bZb5rXZq82Ywka3Z2IYBzP1LAPC
         M0ow==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572527; x=1778177327; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qtILulUHLT79WWgPQDmAPEa958VjeDPVeBWr5Lm8OvQ=;
        b=kjsGEOZVF9X1YXb4krhsUiSarJYKI1XPnPfU3ZwppYXh9GDlLc4yb74V0FhpJMSAMC
         V6vm5kkIh/p/D+p99X6g0aN1tnLIuwYHUY478J9j1EYIWbpKcnPuoi/WmXlHekBZb3q5
         vCWP60+/N4qGr6Vd/GRQxTROJVKcGv0KihW9FAyaqzkF2zB0Tg+5iAXle+HN5yu1V/le
         EtflBRl6VNuJ8PrFZzjJZ66AGjxxl2fG1FnWqKjwPETmywni1QO9jdTEzsdJuRUYgyjF
         sN6TGjRcbn9h/Hisp6Dnuh0soH6vKBg6ZXcobqo/S+TZbTjQny4fMdGVuqKrYbH1L4O4
         6nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572527; x=1778177327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtILulUHLT79WWgPQDmAPEa958VjeDPVeBWr5Lm8OvQ=;
        b=J+Wqp3wDeEhdSX+vhoi6IjGHxREF7cdHbAuY4QL1Dv9UGLNe4ED5OsO2u9nIleX7RC
         YJGnnA4rg7amaMSAjYBKTRmGt91nVSDh5Xo4KnMsEdLuoYDjE5nfYPZX/B6glp5zBtlm
         j/W83kD7/FAuyr7ngrzTp895rkFta6GGVVENScI+HEZu7Om6gpE+75925gVYAGreFNEN
         lZHo1nFQXa7h5msjaOvq8TyN27Tz5tqP9uDlt/SMtulTqOQXL1JiAkOSbZTiX/4/iy2B
         CK+CW53BThJqspIQDgj5zRfw6JeTVBmvrqtLuB9hlp7Fsva481O7VrtriXCeWnRfMj63
         RQ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/v5kObwTWOgssr36xh6+dApzVXOznfnjYO88GrNxzZMo02g39OM0X6VpXqAmM6Hatkx5TGEjLzxI5edw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwVFUw4xvaq75HfQkJ2Vk3Mwm61ouJlVXEXVMdS6mXB3ZjFY+un
	y1+KhuPjxyUYXaBzF67OeMf70of17A6Qiji0JwQ7njJcrNfZQDsUMOONiHKBt+OEuvkLarB7lin
	YM/ky+826ZiU35IyD/Q7iMTCeyXHK8nE=
X-Gm-Gg: AeBDieuGEu5pZLNVGHVUc90IeUW0BpNgr4kgOJpsjPLEHPSc3RpVSHAzVW1INL1vWVM
	xCv0bIsTEFnU8+TqkAzsBjYPdeKbYDa8fbSfXWU/nlevHCGGwx7k1cRIxvNaFnZprvfoYnDFw7Q
	1vEbuk5CyC6tuhF/DMZG+5fdvrEfv+2ZBuw6Ign95pKNmIhHN2JJDoWNEwVVkbvlc2f74ATzoSD
	P2tzC8KxF2bJt2ErI/aX1NA+4oryggx7oK7RPY+a4plGA2WD2vIPbo+5vtjNiENACdcnbGp6aSF
	4GG0XVbTPfY2KnBYaY6PO/ZV4ufuXfhQTAM7jwYxlZsGdtTj+RspZl83nbedRd8o4AM1y4k2ENH
	xqhyKOo8Yl3nSMfw=
X-Received: by 2002:a05:6000:2088:b0:43d:21a:9a3e with SMTP id
 ffacd0b85a97d-4493fafa84cmr6321669f8f.32.1777572526974; Thu, 30 Apr 2026
 11:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260430175437.3699-1-sonionwhat@gmail.com> <2026043050-kinetic-unquote-f6b5@gregkh>
In-Reply-To: <2026043050-kinetic-unquote-f6b5@gregkh>
From: Bentley Blacketer <sonionwhat@gmail.com>
Date: Thu, 30 Apr 2026 14:08:35 -0400
X-Gm-Features: AVHnY4K1xI-TWWYwd3WX-CQFfBG3KWWe6FYT29WErW5rOw8Pwhfqv4Y-FhDlooU
Message-ID: <CAD3iFGNtqoGUUybvM2kU-hz5vRstukmCY1x9TywF8BairgUypA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spamd-Bar: --
X-MailFrom: sonionwhat@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HE2X4COEBWPMJTHATBJRUEPNVCDB3YZT
X-Message-ID-Hash: HE2X4COEBWPMJTHATBJRUEPNVCDB3YZT
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:44 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HE2X4COEBWPMJTHATBJRUEPNVCDB3YZT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6511678716324234813=="
X-Rspamd-Queue-Id: B0EE84AEFB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[24];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

--===============6511678716324234813==
Content-Type: multipart/alternative; boundary="000000000000086a5e0650b15b4f"

--000000000000086a5e0650b15b4f
Content-Type: text/plain; charset="UTF-8"

>
> Hi Greg,
>
> Thanks for the feedback. Based on my research, the only commercial
> products to ship with Greybus were Motorola Moto Mods (discontinued)
> and the original Project Ara hardware. BeagleConnect Freedom uses
> Greybus but for IoT prototyping rather than the bootrom firmware
> loading path this code covers.
>
> Given that, I believe the VID/PID "empty module" concern the original
> FIXME references is no longer relevant in practice. However if you're
> aware of active hardware where this bootrom path is still exercised
> with potentially empty VID/PIDs, I'm happy to keep it as dev_info.
>
> I'll send v5 fixing the extra space in Signed-off-by and restoring
> the blank line regardless.
>
> Regards,
> Bentley

--000000000000086a5e0650b15b4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Greg,<br><br>Thanks for the fee=
dback. Based on my research, the only commercial <br>products to ship with =
Greybus were Motorola Moto Mods (discontinued)<br>and the original Project =
Ara hardware. BeagleConnect Freedom uses <br>Greybus but for IoT prototypin=
g rather than the bootrom firmware <br>loading path this code covers.<br><b=
r>Given that, I believe the VID/PID &quot;empty module&quot; concern the or=
iginal <br>FIXME references is no longer relevant in practice. However if y=
ou&#39;re <br>aware of active hardware where this bootrom path is still exe=
rcised <br>with potentially empty VID/PIDs, I&#39;m happy to keep it as dev=
_info.<br><br>I&#39;ll send v5 fixing the extra space in Signed-off-by and =
restoring <br>the blank line regardless.<br><br>Regards,<br>Bentley
</blockquote></div></div>

--000000000000086a5e0650b15b4f--

--===============6511678716324234813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6511678716324234813==--
