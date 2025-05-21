Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA78ABF2D8
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:29:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D561C4440A
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:29:02 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lists.linaro.org (Postfix) with ESMTPS id 8A8893F68D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 10:32:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=R8jtWTkv;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.172 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-708b31650ffso56760297b3.0
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747823551; x=1748428351; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+xKUuBzIrWzIqcDA2Mj34JobvtGNSUz1ZOpCCYQW0qE=;
        b=R8jtWTkv/kLP5gH8JbwxEMjj0S9hrTJyZsNsMf29rXEeRBXag2batKKk/gTGFY9YyR
         /iLCKEUSlkqrtbSoBhJIusLDim1lGK7CKe3Zxw5kQ8lF9AE1orlKUJEuluDX/9ACRcYZ
         QArPk2yKF0FBlX54ncoJHHKxx4EvC+/2QOqhuBkHDg5AuFNuxMW3fNJK4H1A1XZdNLGb
         NCbl0lIMQgA/Yt8Tdnyi1+F0i2llUBM9U8lXgJw3J4Fx4y+vAiy9lkE33NrYUZDdxp3F
         fqZXfnWg9jBIbYorhGwL6lSQCRX/3/7IAOpJrlbt8/T7NY2YuxWG+KzpcmzL+hA+q2iR
         QHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823551; x=1748428351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xKUuBzIrWzIqcDA2Mj34JobvtGNSUz1ZOpCCYQW0qE=;
        b=wroKcImITUV8IUAvdXF2rzR+nHEnv9wYKrQJPzrFj0gFax4LE+UvfDI18mBbKf7Rqp
         U415dX7vwKW6H83X8thIavfH9gAjpVSDUlR7aDfQ2TWjKVFToDKZGGmXmgugBP/vQErv
         pJm51Kv5Dn8SToL63KISvTI7eqZhVaGSZonk5e/no8f9kHlmffVqTDtP4LOUxYv//4vJ
         EsD2R5ouWIWYXdUkZBdledUpUgiOUhGwCXgNUOeQZYUaUwpm0KIBDTcM7pfxrduKGzoI
         UJoQlt8juwdgYIM/WUjEmwkkTOaMeRq31m6Naox43X+Z4bKblOnA/nb61S3DaYpcfW8s
         H7lw==
X-Gm-Message-State: AOJu0Yy/9fQjNt0iM6canQlrODB3VSOl+JAAoJgus9WHmLXOOk5a+N+Q
	n1OYOX90n5WQdkj3Cl7BNJp/LbsoNVJ+MZOtAtUQln64wriQ/SD3TYB1e5fgV7jHXmxHqccV0iP
	6vkaLHhQcoYuKsYsJl8VutfQFP4VUOGM=
X-Gm-Gg: ASbGncs9mhezvHxMlwqweLYl8w4VnVPNfmS0j2k4pyGHiPn0wsHAXHs7t4QaYAzML/J
	50kXvqYfoYIm0iJ1Xx/yaXZbrLqOkGHMYiRFUTGXud2o1QS/cp0INDUnyCT+HokV4jX91wQgxwK
	DvbF4UxSZoiHOzaMOmlOkwk1dWlcOiq9HjOPwhfTDQisEjm312Ml8D2TKYVRBU96DACOE=
X-Google-Smtp-Source: AGHT+IEDj/W1HJFWzlqD5iTXicreoSPFsSKnWonjQaLazyLtLDHNoLx9EYM3Y22fSqbPhKlaMGtEgYv6xF7DROa0jkU=
X-Received: by 2002:a05:690c:f0a:b0:70d:ecdd:9bd0 with SMTP id
 00721157ae682-70decdda036mr61087097b3.27.1747823551044; Wed, 21 May 2025
 03:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
In-Reply-To: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 16:02:19 +0530
X-Gm-Features: AX0GCFuAmDTatU5VuMKvEoIORb2OWOQx30MAV2CpEZhZ5ug9nnvbQiP3bfaGTWU
Message-ID: <CAG+54DZS97pLM3+xAAPN9wSPtNQRKdRJooYwuS870f0c0k70=g@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.172:from];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 8A8893F68D
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ISW6VP3WZ4RZZ2LC4V4AH3SVBD6W2JWD
X-Message-ID-Hash: ISW6VP3WZ4RZZ2LC4V4AH3SVBD6W2JWD
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:42 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V1] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ISW6VP3WZ4RZZ2LC4V4AH3SVBD6W2JWD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4185941700535523392=="

--===============4185941700535523392==
Content-Type: multipart/alternative; boundary="000000000000e3e68b0635a2e1c8"

--000000000000e3e68b0635a2e1c8
Content-Type: text/plain; charset="UTF-8"

>
>
> This is the new Patch for the earlier Patch hence made V1.
>
> [Note: there will be no significant changes.]
>
> Changes:
>
> To ensuring that the firmware tag is properly null-terminated. When
> copying firmware tag strings to prevent buffer overflows and ensure data
> integrity.
>
>
> Changes has been made in 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
>
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
> b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa..f37904b91 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
>         intf_load.major = 0;
>         intf_load.minor = 0;
>
> -       strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> +       strscpy((char *)&intf_load.firmware_tag, firmware_tag,
>                 GB_FIRMWARE_U_TAG_MAX_SIZE);
>
>         ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
> @@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
>         /* Get Backend Firmware Version */
>         printf("Getting Backend Firmware Version\n");
>
> -       strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> +       strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
>                 GB_FIRMWARE_U_TAG_MAX_SIZE);
>
>  retry_fw_version:
> @@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
>         /* Try Backend Firmware Update over Unipro */
>         printf("Updating Backend Firmware\n");
>
> -       strncpy((char *)&backend_update.firmware_tag, firmware_tag,
> +       strscpy((char *)&backend_update.firmware_tag, firmware_tag,
>                 GB_FIRMWARE_U_TAG_MAX_SIZE);
>
>  retry_fw_update:
> --
> 2.43.0
>
>





Fixed the mail style issue for the patch , kindly confirm if this is valid
> format.


thank you,
regards,
rujra bhatt

--000000000000e3e68b0635a2e1c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container" dir=3D"a=
uto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
This is the new Patch for the earlier Patch hence made V1. <br>
<br>
[Note: there will be no significant changes.]<br>
<br>
Changes: <br>
<br>
To ensuring that the firmware tag is properly null-terminated. When copying=
 firmware tag strings to prevent buffer overflows and ensure data integrity=
.<br>
<br>
<br>
Changes has been made in 3 positions:<br>
1: update firmware tag<br>
2: backend update firmware tag<br>
3: backend update firmware tag with unipro<br>
<br>
Signed-off-by: Rujra Bhatt &lt;<a href=3D"mailto:braker.noob.kernel@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">braker.noob.kernel@gmail.com</a>&g=
t;<br>
---<br>
=C2=A0drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---<=
br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/dr=
ivers/staging/greybus/Documentation/firmware/firmware.c<br>
index 765d69faa..f37904b91 100644<br>
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c<br>
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c<br>
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 intf_load.major =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 intf_load.minor =3D 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy((char *)&amp;intf_load.firmware_tag, fi=
rmware_tag,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strscpy((char *)&amp;intf_load.firmware_tag, fi=
rmware_tag,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GB_FIRMWARE_U_TAG_M=
AX_SIZE);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VAL=
IDATE, &amp;intf_load);<br>
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get Backend Firmware Version */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Getting Backend Firmware Version\n=
&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy((char *)&amp;backend_fw_info.firmware_t=
ag, firmware_tag,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strscpy((char *)&amp;backend_fw_info.firmware_t=
ag, firmware_tag,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GB_FIRMWARE_U_TAG_M=
AX_SIZE);<br>
<br>
=C2=A0retry_fw_version:<br>
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Try Backend Firmware Update over Unipro */<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Updating Backend Firmware\n&quot;)=
;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy((char *)&amp;backend_update.firmware_ta=
g, firmware_tag,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strscpy((char *)&amp;backend_update.firmware_ta=
g, firmware_tag,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GB_FIRMWARE_U_TAG_M=
AX_SIZE);<br>
<br>
=C2=A0retry_fw_update:<br>
-- <br>
2.43.0<br>
<br>
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"></blockquote></div><div class=
=3D"gmail_quote gmail_quote_container" dir=3D"auto"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div class=3D"gmail_quote gmai=
l_quote_container" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fixed the ma=
il style issue for the patch , kindly confirm if this is valid format.</blo=
ckquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">thank you,</div=
><div dir=3D"auto">regards,</div><div dir=3D"auto">rujra bhatt</div><div cl=
ass=3D"gmail_quote gmail_quote_container" dir=3D"auto"></div></div>

--000000000000e3e68b0635a2e1c8--

--===============4185941700535523392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4185941700535523392==--
