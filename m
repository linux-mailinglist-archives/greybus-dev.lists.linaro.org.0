Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIKOMbMo+WnS6AIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 05 May 2026 01:16:03 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C336E4C4C78
	for <lists+greybus-dev@lfdr.de>; Tue, 05 May 2026 01:16:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 247E0406A9
	for <lists+greybus-dev@lfdr.de>; Mon,  4 May 2026 23:16:01 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	by lists.linaro.org (Postfix) with ESMTPS id 43E1D404C7
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 23:15:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="B/wjlQmy";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of dmitry.torokhov@gmail.com designates 74.125.82.47 as permitted sender) smtp.mailfrom=dmitry.torokhov@gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c45281a06so7198553c88.1
        for <greybus-dev@lists.linaro.org>; Mon, 04 May 2026 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777936556; x=1778541356; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJUaPNEnLT6eI3Sz+OplXWx4CX0ycNqOaqliP4b8tDU=;
        b=B/wjlQmymYFQ1izdE8gWO2RXkLUl65GOc/EjW/CsXAdIKYw8+2l+itHiIZ8zDFCHXa
         yMez4chD0lJRyL+So9RdJvRLWThJnP45TVMgukQ48j/LBdMegg78vLwcmMfWcYBQpGWG
         GFx5m0tc+JiEY6tfFuhdYZ0T7KPRUmB0paV+Kl9UVFSwnvZ6gF7+Ry+YfJ+gi5ncicrf
         3OiAwKkRAblFhzInBjTNT1ova6UvoDOgA/E5MckKsr9xdEQ06ZHCTsAO/nMlFjyafCY8
         nA/gRgj7TiuDT0RhTECj9lgt1toowQEzwQVMRuo2Jo6QYO2VW9ddyri88+lmlHmhgHuO
         vCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777936556; x=1778541356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJUaPNEnLT6eI3Sz+OplXWx4CX0ycNqOaqliP4b8tDU=;
        b=SXInHBrRaSmAWRiPh66LLDy0wtlD2hMOLyQVhzQZPEclpxyyjPDVCNI3YbPFWiM61a
         e/xMaDP5OTiFN78SxLu9+yNoqsgyMIhNrfgp2h4L9UZEJrZuQ4GUx+hY45EYOXJextoj
         zziak0edQI74+CWQRDAxxr972rHbLjrrgbW3+NgzpmCXO6PV3tlRI1dJG3OEbVUdzV88
         DfiqCkdJy9fZhgjCcIAwlLYVgMNg1fXARjGjrLR4AYEoTwcZu01J6OiRSgt/fsFMiOeE
         lNlFz0h0qwsMsK7yR5rr0bcGfM7H7AUjdSWQNEhTowBTwnRAQVLAZT9aGI19IEu5qinp
         EmTw==
X-Forwarded-Encrypted: i=1; AFNElJ+g3fCaFBi5go9q9KgySOrDd6F7S7IFsIW82cM7P7VZrDMAyEGYqleVSUu+YpuVI3l8G4hDAml3ube0OQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxMGdeyCs5bvXX4YosKV7vxfuzMTPHMX8MkUQnVcpfxnoV0eNEg
	mg+svyF1C46rt3ZkxIQfAxZenr9tpbxKw71vaG3vJ2DYuZhpUaIqT8Gh
X-Gm-Gg: AeBDievYyqWjlNyVhtyXBxNDq/uucjPcA3fOYRdu8rKATm58ftH7j8o2ETsWVe9FvS+
	RJMuvrWCOir0KrblqqLHuBFFdkBK53iu9hsXublhU9v/nUj4QBgq+johiVstzInx6JTF5Wf3hwi
	K/r+L8NyRnlDPzrAYcp+/cDtDI0qDGgE0ne11gneLQ+Y21FHeb0VcFJjrAx1PP/MxRfG5BdsVge
	CKvTJcjr9n3DVwdmTGn8ZNvKc1Hut3Tmhjf24dGzXlPeEmYnIJb8CvSG8xAE0aTynwMdzQMBDuH
	tymA9YkA1NehGsaX3shgYdr5WqakQEl8dXXOjfLqcm5ctDekGlDjrlraeindBgt6xiiUjw+mAlx
	1pBJp+51CQuDpjnYwsxRXsthkysRe7oXECpU39PlnppSs0dJxRi+tljqgqP9gA9btLbsP5+gFYX
	1SW7Sfp5hvnVVfW2c2r5hspeqriPOiSGquRBu9LngXKxkXhJ3Xeh1uoyWgxjpFQEQW2Zhky790k
	I0avOrn8hgJ5Q==
X-Received: by 2002:a05:7022:605:b0:12c:8b9:7208 with SMTP id a92af1059eb24-130b1b67874mr477748c88.26.1777936556135;
        Mon, 04 May 2026 16:15:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5b87:9b19:32e2:2981])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm20605766c88.10.2026.05.04.16.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:15:55 -0700 (PDT)
Date: Mon, 4 May 2026 16:15:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Message-ID: <afknxbpP7oj4bNab@google.com>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
 <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>
X-Spamd-Bar: ---
Message-ID-Hash: OGOWR676CS2SVTQZKM72LLKAFMTKWAM6
X-Message-ID-Hash: OGOWR676CS2SVTQZKM72LLKAFMTKWAM6
X-MailFrom: dmitry.torokhov@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Kosina <jikos@kernel.org>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 4/4] HID: wacom: use __free(kfree) to clean up temporary buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OGOWR676CS2SVTQZKM72LLKAFMTKWAM6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C336E4C4C78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]

Hi Benjamin,

On Mon, May 04, 2026 at 10:47:25AM +0200, Benjamin Tissoires wrote:
> @@ -386,10 +381,11 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>  	case WACOM_HID_WD_OFFSETRIGHT:
>  	case WACOM_HID_WD_OFFSETBOTTOM:
>  		/* read manually */
> -		n = hid_report_len(field->report);
> -		data = hid_alloc_report_buf(field->report, GFP_KERNEL);
> +		u8 *data __free(kfree) = hid_alloc_report_buf(field->report, GFP_KERNEL);
> +
>  		if (!data)
>  			break;
> +		n = hid_report_len(field->report);
>  		data[0] = field->report->id;
>  		ret = wacom_get_report(hdev, HID_FEATURE_REPORT,
>  					data, n, WAC_CMD_RETRIES);
> @@ -400,7 +396,6 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>  			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
>  				 __func__);
>  		}
> -		kfree(data);
>  		break;
>  	}

I'd recommend establishing a new scope for the "data", otherwise it is
fragile. If there was another label below then this cleanup would
explode since current scope of "data" is from the declaration point
until the end of the switch statement.

Having a dedicated scope makes lifertime explicit.

Thanks.

-- 
Dmitry
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
