Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF06C39DB
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78C1C3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	by lists.linaro.org (Postfix) with ESMTPS id EE7633E95E
	for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 09:33:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=UesMPWRF;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.48 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id x3so43992862edb.10
        for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679304826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e3QdF0wMkBTmtVBS8ynp8ovaXMshD0DpAnNchV77vtY=;
        b=UesMPWRFpR2JX5vPVbvxYR1zQ+M+IhSMpWZH2lIpwZ0WZoIufebUX5DzgeExhxsh7f
         2ANido3DAEPiekrASioV8YH/Jgcw3esOfddOi4zUrFGfwZH+R7TNm67sArqs/cA7Zz5F
         A7AyqxWgJjo8G9/PU64k17rMzERIA8qXy56VI5gym42uXNTsm/mpiul0NW5VkB4AhCiI
         4Kyo+ano9ElnW2faIL27Uj7bGtTQbDO4kn+9y4GHB2ELbwX5BjABnNaG0vWTvrEkjcu1
         q/HiAokTchc8jfj0QCgB/f8Zcm/suqr7eLzE29iRGb5WnLKftKTj1VuEUDJ0dBI48GyS
         cozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679304826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3QdF0wMkBTmtVBS8ynp8ovaXMshD0DpAnNchV77vtY=;
        b=sbC5E7VFPsKj/XsNSgM3wWzAoUd0F8ZuC5YDZwBhDFuuS17IrIS7azhNVNhddkEvnB
         voAspMXHgJTxsx1g14ijgD4IbXbYZOIuocZz4iqTaRivV1QXKdJcBI6QyjFjPLhi5eDN
         6fLeG1MrWaX8N33eb816igUC+sgAZmKRusESBSEeN/N/UMTvX3Ub+cCDCeJIo5zUysUz
         K+xwKlgQKFG2tIizEcBgfFDhL6tXYDQankqb2SrtZwY9LZM8UMhyGDFYVMshuNCzitw5
         ZqBNrqFav6QTYwEMRGjTxG3C44TQjTxripn/IVy5CF5Q2JKqNBDisZUJrtbNVA9VByhY
         pYZg==
X-Gm-Message-State: AO0yUKVCeW9HH0hb+mqTkg9JtnXfv18q0CiwAWG9FmNC1Jfe33DVXy0s
	ERNXCEFrxDdAsdSWdE4w0KA=
X-Google-Smtp-Source: AK7set8Qn657Y7DA+BYuCWXB4qfbuxFmPEcongWcCbMjvnz5MP4Uux0KQPqqqU1zWuDfyZSENqbyDw==
X-Received: by 2002:a17:906:f193:b0:933:868:413a with SMTP id gs19-20020a170906f19300b009330868413amr8046651ejb.15.1679304825710;
        Mon, 20 Mar 2023 02:33:45 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id p25-20020a17090653d900b009333b82f061sm2492372ejo.80.2023.03.20.02.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 02:33:45 -0700 (PDT)
Date: Mon, 20 Mar 2023 14:33:43 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Message-ID: <ZBgod938/PJX1xsE@khadija-virtual-machine>
References: <20230319164520.GA125117@sumitra.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230319164520.GA125117@sumitra.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EE7633E95E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.48:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EGJ4ZPSP3SQLB3773WFYUQOF4GHJKO7G
X-Message-ID-Hash: EGJ4ZPSP3SQLB3773WFYUQOF4GHJKO7G
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Staging: greybus: Fix lines ending with '('
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EGJ4ZPSP3SQLB3773WFYUQOF4GHJKO7G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Mar 19, 2023 at 09:45:20AM -0700, Sumitra Sharma wrote:
> The coding style used to limit lines to 80 characters,
> which led to splitting of these function headers into multiple
> lines and ends the first line with a '('.
> Such splits causes checks reported by the checkpatch.
> 
> Place the function parameters of each function immediately after
> '(' in a single line to align the function headers.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  .../staging/greybus/audio_manager_module.c    | 40 +++++++++----------
>  1 file changed, 18 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 0a0f0a394c84..81b4ba607a0e 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -70,9 +70,8 @@ static void gb_audio_module_release(struct kobject *kobj)
>  	kfree(module);
>  }
>  
> -static ssize_t gb_audio_module_name_show(
> -	struct gb_audio_manager_module *module,
> -	struct gb_audio_manager_module_attribute *attr, char *buf)
> +static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
> +					 struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s", module->desc.name);
>  }
> @@ -80,9 +79,8 @@ static ssize_t gb_audio_module_name_show(
>  static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
>  	__ATTR(name, 0664, gb_audio_module_name_show, NULL);
>  
> -static ssize_t gb_audio_module_vid_show(
> -	struct gb_audio_manager_module *module,
> -	struct gb_audio_manager_module_attribute *attr, char *buf)
> +static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
> +					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%d", module->desc.vid);
>  }
> @@ -90,9 +88,8 @@ static ssize_t gb_audio_module_vid_show(
>  static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
>  	__ATTR(vid, 0664, gb_audio_module_vid_show, NULL);
>  
> -static ssize_t gb_audio_module_pid_show(
> -	struct gb_audio_manager_module *module,
> -	struct gb_audio_manager_module_attribute *attr, char *buf)
> +static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
> +					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%d", module->desc.pid);
>  }
> @@ -100,9 +97,9 @@ static ssize_t gb_audio_module_pid_show(
>  static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
>  	__ATTR(pid, 0664, gb_audio_module_pid_show, NULL);
>  
> -static ssize_t gb_audio_module_intf_id_show(
> -	struct gb_audio_manager_module *module,
> -	struct gb_audio_manager_module_attribute *attr, char *buf)
> +static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *module,
> +					    struct gb_audio_manager_module_attribute *attr,
> +					    char *buf)
>  {
>  	return sprintf(buf, "%d", module->desc.intf_id);
>  }
> @@ -111,9 +108,9 @@ static struct gb_audio_manager_module_attribute
>  					gb_audio_module_intf_id_attribute =
>  	__ATTR(intf_id, 0664, gb_audio_module_intf_id_show, NULL);
>  
> -static ssize_t gb_audio_module_ip_devices_show(
> -	struct gb_audio_manager_module *module,
> -	struct gb_audio_manager_module_attribute *attr, char *buf)
> +static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *module,
> +					       struct gb_audio_manager_module_attribute *attr,
> +					       char *buf)
>  {
>  	return sprintf(buf, "0x%X", module->desc.ip_devices);
>  }
> @@ -122,9 +119,9 @@ static struct gb_audio_manager_module_attribute
>  					gb_audio_module_ip_devices_attribute =
>  	__ATTR(ip_devices, 0664, gb_audio_module_ip_devices_show, NULL);
>  
> -static ssize_t gb_audio_module_op_devices_show(
> -	struct gb_audio_manager_module *module,
> -	struct gb_audio_manager_module_attribute *attr, char *buf)
> +static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *module,
> +					       struct gb_audio_manager_module_attribute *attr,
> +					       char *buf)
>  {
>  	return sprintf(buf, "0x%X", module->desc.op_devices);
>  }
> @@ -181,10 +178,9 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
>  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
>  }
>  
> -int gb_audio_manager_module_create(
> -	struct gb_audio_manager_module **module,
> -	struct kset *manager_kset,
> -	int id, struct gb_audio_manager_module_descriptor *desc)
> +int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
> +				   struct kset *manager_kset,
> +				   int id, struct gb_audio_manager_module_descriptor *desc)
>  {
>  	int err;
>  	struct gb_audio_manager_module *m;
> -- 
> 2.25.1
> 
>

Hi Mentors,

I came across a same check error in greybus/audio_topology file.
Would it be okay to send a patch similar to this one?

Regards,
Khadija

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
