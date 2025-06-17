Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B814ADCCC2
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Jun 2025 15:16:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5798A445C7
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Jun 2025 13:16:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 83B3744556
	for <greybus-dev@lists.linaro.org>; Tue, 17 Jun 2025 13:16:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=X1FnF3cG;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD2C944E6A;
	Tue, 17 Jun 2025 13:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC8C4CEEE;
	Tue, 17 Jun 2025 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750166169;
	bh=9cun8hm4DoSGnNtasEwFjJD+AdzVWvo5ehIT5kRvc1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1FnF3cG7xN00Z3jv1IhIBVmLNV2+EBG29+diL76dmyi6pW646s3tG1devedyKeUZ
	 ZWf0o9JgV2AUasE6/z5q9axVKeQWAPAVWkZVcyYZGvvJyTf9kpl1MxwAgyNjLARpSZ
	 FM66ffyNZd7AyNQPBt/1R3ZtrfqxlTGoBCejAXdA=
Date: Tue, 17 Jun 2025 15:16:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Message-ID: <2025061743-surging-legwarmer-b3a9@gregkh>
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
X-Spam-Level: **
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 83B3744556
X-Spamd-Bar: ++
Message-ID-Hash: RPAUK5MVNX3CHMSD5PNDFSAO6BE7V3CE
X-Message-ID-Hash: RPAUK5MVNX3CHMSD5PNDFSAO6BE7V3CE
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: firmware: use strscpy, fix tag size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RPAUK5MVNX3CHMSD5PNDFSAO6BE7V3CE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 17, 2025 at 06:21:37PM +0530, Pranav Tyagi wrote:
> Increase the size of firmware_tag arrays in the following structs from
> GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
> accommodate null termination:
> 	- fw_mgmt_ioc_intf_load_and_validate
> 	- fw_mgmt_ioc_get_backend_version
> 	- fw_mgmt_ioc_backend_fw_update
> 	- fw_mgmt_ioc_get_intf_version
> 
> Replace strncpy() with strscpy() to ensure proper null termination as
> firmware_tag is interpreted as a null-terminated string
> and printed with %s.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..3b4061f4b34a 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
>  
>  	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
>  	if (ret < 0) {
> @@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
>  	/* Get Backend Firmware Version */
>  	printf("Getting Backend Firmware Version\n");
>  
> -	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
>  
>  retry_fw_version:
>  	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
> @@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
>  	/* Try Backend Firmware Update over Unipro */
>  	printf("Updating Backend Firmware\n");
>  
> -	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
>  
>  retry_fw_update:
>  	backend_update.status = 0;
> diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
> index b6042a82ada4..ad5b2c8a6461 100644
> --- a/drivers/staging/greybus/greybus_firmware.h
> +++ b/drivers/staging/greybus/greybus_firmware.h
> @@ -38,20 +38,20 @@
>  
>  /* IOCTL support */
>  struct fw_mgmt_ioc_get_intf_version {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u16 major;
>  	__u16 minor;
>  } __packed;
>  
>  struct fw_mgmt_ioc_get_backend_version {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u16 major;
>  	__u16 minor;
>  	__u8 status;
>  } __packed;
>  
>  struct fw_mgmt_ioc_intf_load_and_validate {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u8 load_method;
>  	__u8 status;
>  	__u16 major;
> @@ -59,7 +59,7 @@ struct fw_mgmt_ioc_intf_load_and_validate {
>  } __packed;
>  
>  struct fw_mgmt_ioc_backend_fw_update {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u8 status;
>  } __packed;
>  

You are changing the size of a userspace structure here, are you SURE
this is allowed?

How was this tested?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
