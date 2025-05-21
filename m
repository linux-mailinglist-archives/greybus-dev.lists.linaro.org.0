Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5BABF2D0
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:28:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 472C744407
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:28:41 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	by lists.linaro.org (Postfix) with ESMTPS id 81F2D3F68D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 04:57:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=hWtfwqXM;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.173 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70dec158cc1so11017317b3.0
        for <greybus-dev@lists.linaro.org>; Tue, 20 May 2025 21:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747803423; x=1748408223; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LmckIIGT8yVblGvyUqQcWyw1PyOoO9FxgQykWbwGVrc=;
        b=hWtfwqXMFpA60u4k3KboMbBUxF1ZVgQqRq3wJafLY6B6iy0AEsz7xtJOXpd9z5fsHM
         OgqxKG3QAKKM2jp2sdUsMEOwxEZD6+WxjzmfXEgm5Y7X+fhJ76OxC4DHfW81Inhc/IfD
         Sq18N9In//qTPWqGm0fvY4hYrY4o/VNJSqstLSiZyUq41FAZ1BmH3LVC2vtDXuLNV8Nc
         bS7/2Ti2YcSmmewz3SRyFBLbYia5+WfEHuH0PUFwHHxpxsxbDIEPlLjSET2JCiCupWwn
         /jRLEuws/JHKImLkdmFI4RP5Klfnt7rXHTYgm/2wvVWSMW6XqgSz/4UDPzgzWw7rzMCF
         yxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747803423; x=1748408223;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmckIIGT8yVblGvyUqQcWyw1PyOoO9FxgQykWbwGVrc=;
        b=N2Qp74UUdW1ak3k0xK7CM7ksD6jJsTKsGmnL2BrB74KXoZpmUNbx6hybeWCNscIAP+
         oqypL9PpJr0eDDIHXc5l+f1eNL5dL9BEZBA62nA9RpZWWz/vDYaHfFJdbIFZ2prl34+Q
         mBM7Nv3dypA36mvk5fWx+OZzNRh9v4FMZQWP1bMjGwtXlWCTenhJMqw1i+EPSP62Ptmn
         HMxYA7Xks+zem2lE6swqxPDFnEcKvsWzxY09aSwvW+8SYMbMW06/2pKDRy8hoPBbE3UT
         7je+D2zTwCR8/+x6Br76nXy8z7KPeL3ZEG/JcPnWBjnTtbicC6PiVUzLwInICcmrg0F6
         zm1A==
X-Gm-Message-State: AOJu0Yx3Xb9hoOXdbrcmMR9SGW4gn5/oFzonchVwtVoVC0S69Ro+PZuh
	4+vT5YOj7vBFIvtx+IQo/sMgJfs31plnA/oIiY6SxmUSEnW1eUCs0lzkK15sop+AcM+jNKMXex9
	FgckvcO515BsqQugbY8tqR05ikV4rdwY=
X-Gm-Gg: ASbGnctXTgoJ/pGTVyukIvQm7X8taVlIuyS054OC1U2SPxYge3vclRCwrgQ+QH6eH7D
	mSgr+GVJf3tDrjdRm/FrFxDmEutdJtVnkMVXB7iKQWt590bhoLT70HOuJNYK3SWKuw4XLqwTRzA
	CsuwQDYSlGceQpX3zLvlAwBPbEtHol6Ep5y9fZ0hg+YRzC4PcW7y1MSAxLW9azu6Kx
X-Google-Smtp-Source: AGHT+IEWACZUbEn/Qvjby0NOVMqGnBxCdnWU21NIdYQPnzISHC6IxPhE6ErXjJ9myeXwvkONTIpEdWeO/LjmyEhrwoM=
X-Received: by 2002:a05:690c:4b8f:b0:6ff:2777:92b7 with SMTP id
 00721157ae682-70ca89425d0mr263705067b3.9.1747803422994; Tue, 20 May 2025
 21:57:02 -0700 (PDT)
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 10:26:52 +0530
X-Gm-Features: AX0GCFvr_1t0VGeoEGMfBmVXMgLUGm9UXK5DksnneiF0m3jEivpuHRiT-6JKn_w
Message-ID: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[mail.gmail.com:mid,mail-yw1-f173.google.com:rdns,mail-yw1-f173.google.com:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.173:from];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 81F2D3F68D
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QATG6SL3OQSWI7UWJPAVD3OTZFVV75ZI
X-Message-ID-Hash: QATG6SL3OQSWI7UWJPAVD3OTZFVV75ZI
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:39 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QATG6SL3OQSWI7UWJPAVD3OTZFVV75ZI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To ensure that the firmware tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.


changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
        intf_load.major = 0;
        intf_load.minor = 0;

-       strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+       strscpy((char *)&intf_load.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
        /* Get Backend Firmware Version */
        printf("Getting Backend Firmware Version\n");

-       strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
        /* Try Backend Firmware Update over Unipro */
        printf("Updating Backend Firmware\n");

-       strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_update.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_update:
--
2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
